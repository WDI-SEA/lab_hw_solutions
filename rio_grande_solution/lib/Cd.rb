require_relative 'Item.rb'
class Cd < Item

    attr_accessor :run_time, :tracks, :artist

    def initialize name, price, weight=0
        super(name, price, weight)
        @run_time = ""
        @tracks = 0
        @artist = ""
    end
end