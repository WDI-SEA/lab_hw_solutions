require_relative 'DigitalItem.rb'
class EBook < DigitalItem

    attr_accessor :author, :pages

    def initialize name, price, download_size=0
        super(name,price,download_size)
        @pages=0
        @author=""
    end
end