module GemLibrary
  class Reader
    attr_accessor :name, :email, :city, :street, :house

    def initialize(options = {})
      @name = options[:name]
      @email = options[:email]
      @city = options[:city]
      @street = options[:street]
      @house = options[:house]
    end	

    def to_s
     "#{@name}, #{email}"
    end 
  end
end