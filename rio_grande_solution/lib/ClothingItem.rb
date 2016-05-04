require_relative 'Item.rb'
class ClothingItem < Item

    attr_accessor :sizes

    def initialize name, price, weight=0
        super(name, price,weight)
        @sizes = []
        @quantities = {}
    end

    def sell amount, size
        return false unless @quantities.key?(size)
        if @quantities[size] >= amount
            @quantities[size] -= amount
            true
        else
            false
        end
    end

    def stock amount, size
        # @quantities[size] ||= 0
        @quantities[size]=0 unless @quantities.key?(size)
        @sizes.push(size) unless @sizes.include? size
        @quantities[size] += amount
        true
    end

    def return amount, size
        # self.stock amount, size
        @quantities[size]=0 unless @quantities.key?(size)
        @sizes.push(size) unless @sizes.include? size
        @quantities[size] += amount
        true
    end

    def quantity size=false
        if(size==false)
            @quantities.length > 0 ? @quantities.values.reduce(:+) : 0
        else
            @quantities.key?(size) ? @quantities[size] : 0
        end
    end

    # def sell amount, size
    # end

    # def return amount, size
    # end

end