require_relative 'Item.rb'
class Bluray < Item

    attr_accessor :run_time, :director, :producer

    def initialize name, price, weight=0
        super(name, price, weight)
        @run_time = ""
        @director = ""
        @producer = ""
    end    
end