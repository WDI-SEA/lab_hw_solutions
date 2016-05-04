class Item
    attr_reader :quantity
    attr_accessor :name, :price, :description,:weight

    @@ship_price_per_oz=1.2

    @@total_sales = 0

    def initialize name, price, weight=0
        @name = name
        @price = price
        @quantity = 0
        @description = ""
        @weight = weight
    end

    def sell amount
        if @quantity >= amount
            @quantity -= amount
            @@total_sales += amount
            true
        else
            false
        end
    end

    def stock amount
        @quantity += amount
        true
    end

    def return amount
        @quantity += amount
        true
    end

    # unneeded
    # def ship_price_per_oz
    #     @@ship_price_per_oz
    # end

    def ship_price
        return false if @weight == -1
        @@ship_price_per_oz * @weight
    end

    def total_sales
        @@total_sales
    end

end