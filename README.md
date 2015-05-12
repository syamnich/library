# LibraryGem

Library

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'library_gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install library_gem

## Usage

require_relative "library"

#Library create
library = GemLibrary::Library.new

#Add authors
author1 = GemLibrary::Author.new("Goldshtein", "biography1")
author2 = GemLibrary::Author.new("Fulton", "biography2")
author3 = GemLibrary::Author.new("Hartl", "biography3")

#Add books
book1 = GemLibrary::Book.new("Softswitch", author1)
book2 = GemLibrary::Book.new("The Ruby Way", author2)
book3 = GemLibrary::Book.new("Ruby on Rails Tutorial", author3)
book4 = GemLibrary::Book.new("IP-telephony", author1)

#Add readers
reader1 = GemLibrary::Reader.new(name: "John", email: "jonh@gmail.com", city: "LA", street: "m1", house: 1)
reader2 = GemLibrary::Reader.new(name: "Alex", email: "alex@gmail.com", city: "LA", street: "r11", house: 2)
reader3 = GemLibrary::Reader.new(name: "David", email: "david@gmail.com", city: "LA", street: "r3", house: 3)
reader4 = GemLibrary::Reader.new(name: "Michael", email: "michael@gmail.com", city: "LA", street: "gt5", house: 4)

#Add orders
library.add_order(book1, reader1)
library.add_order(book2, reader2)
library.add_order(book3, reader3)
library.add_order(book4, reader4)
library.add_order(book1, reader2)
library.add_order(book1, reader2)
library.add_order(book1, reader2)
library.add_order(book2, reader1)
library.add_order(book3, reader2)
library.add_order(book1, reader4)

puts library.who_often_takes_the_book(book1)
puts library.most_popular_book
puts library.how_many_people_ordered_one_of_the_3_most_popular_books
#puts library.how_many_people_ordered_each_of_the_3_most_popular_books

library.save_to_file("library.yaml")

library_new = GemLibrary::Library.load_from_file("library.yaml")
puts library_new.orders

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/library_gem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
