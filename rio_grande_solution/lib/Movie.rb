require_relative 'DigitalItem.rb'
class Movie < DigitalItem

    attr_accessor :run_time, :director, :producer

    def initialize name, price, download_size=0
        super(name,price,download_size)
        @run_time=""
        @director=""
        @producer=""
    end    
end