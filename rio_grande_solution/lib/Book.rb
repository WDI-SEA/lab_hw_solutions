require_relative 'Item.rb'
class Book < Item

    attr_accessor :author, :pages

    def initialize name, price, weight=0
        super(name, price, weight)
        @pages = 0
        @author = ""
    end
end