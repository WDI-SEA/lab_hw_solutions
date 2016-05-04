require_relative 'DigitalItem.rb'
class Song < DigitalItem

    attr_accessor :run_time, :tracks, :artist

    def initialize name, price, download_size=0
        super(name, price,download_size)
        @run_time=""
        @tracks=0
        @artist=""
    end
end