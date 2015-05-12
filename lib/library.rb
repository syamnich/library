require "library_gem/version"
require "library_gem/author"
require "library_gem/book"
require "library_gem/reader"
require "library_gem/order"
require "yaml"

module GemLibrary
  class Library
   attr_accessor :books, :orders, :readers, :authors

    def initialize(books=[], orders=[], readers=[], authors=[])
      @books = books
      @orders = orders
      @readers = readers
      @authors = authors
    end

    def add_order(book, reader)
      @books <<  book unless @books.include?(book)
      @authors << book.author unless @authors.include?(book.author)
      @readers << reader unless @readers.include?(reader)
      @orders << Order.new(book, reader)
    end


    def who_often_takes_the_book(book)
      selected_orders = orders.select { |order| order.book == book }
      max_value(selected_orders, "reader")
    end

    def most_popular_book
    	max_value(orders, "book")
    end

    def how_many_people_ordered_each_of_the_3_most_popular_books
      popular_3_books = three_most_popular_books
      orders.select{|order| popular_3_books.include?(order.book)}.group_by(&:book)
            .map{ |k,v| {k.title => v.map(&:reader).uniq.size}}
    end

    def how_many_people_ordered_one_of_the_3_most_popular_books
      popular_3_books = three_most_popular_books
      orders.select{|order| popular_3_books.include?(order.book)}.map(&:reader).uniq.size
    end

    def save_to_file(filename)
      File.open(filename, "w") { |f| f.write(YAML.dump(self)) }
    end

    def self.load_from_file(filename)
      YAML.load(File.read(filename))
    end


  private
    def max_value(collection, name)
      collection.group_by(&name.to_sym).max_by{ |k,v| v.size }.first
    end
      
    
    def three_most_popular_books
      @orders.group_by(&:book).sort_by{ |k,v| v.size }.reverse.first(3).map(&:first)
    end
  end
end