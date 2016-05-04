require_relative 'Item.rb'
class DigitalItem < Item

    attr_accessor :download_size

    def initialize name, price, download_size=0
        super(name, price)
        @quantity=1
        @weight=-1
        @download_size=download_size
    end

    def stock amount
        false
    end

    def sell amount
        @@total_sales += amount
        true
    end
    
    def return amount
        true
    end


end