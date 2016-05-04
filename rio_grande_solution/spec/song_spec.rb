require_relative 'spec_helper'
require_relative '../lib/Song'

describe Song do

  before(:context) do
    #initlize item
    @song = Song.new("Song Title",12.99)
  end

describe "Initialization" do
    #check that it is an instance of Song
    it "is an instance of the Song class" do
      expect(@song).to be_instance_of(Song)
    end

    #check that it is an extended from Item
    it "is an instance of the DigitalItem class" do
      expect(@song).to be_kind_of(DigitalItem)
    end    

    #check that it is an extended from Item
    it "is an instance of the Item class" do
      expect(@song).to be_kind_of(Item)
    end

    #check inilization
    it "is assigned a name" do
      expect(@song.name).to eq("Song Title")
    end
    it "is assigned a price" do
      expect(@song.price).to eq(12.99)
    end

    it "should be able to be initalized with a download_size" do
      item2 = Song.new("Digital Item2",2.99,11.22)
      expect(item2.name).to eq("Digital Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.download_size).to eq(11.22)
      expect(item2.ship_price).to eq(false)
    end      
  end

  #check getters and setters
  describe "Accessors" do
    it "should be able to get quantity. Should default to 1." do
      expect(@song.quantity).to eq(1)
    end
    it "should be able to get and set name" do
      @song.name="New Title"
      expect(@song.name).to eq("New Title")
    end   
    it "should be able to get and set price" do
      @song.price=44.99
      expect(@song.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@song.description).to eq("")
      @song.description="test"
      expect(@song.description).to eq("test")
    end    

    it "should be able to get and set run_time" do
      expect(@song.run_time).to eq("")
      @song.run_time="2:01"
      expect(@song.run_time).to eq("2:01")
    end  

    it "should be able to get and set artist" do
      expect(@song.artist).to eq("")
      @song.artist="John Doe"
      expect(@song.artist).to eq("John Doe")
    end   
  end

  describe "Methods" do
    it "should not change quantity on stock" do
      result = @song.stock 5
      expect(result).to eq(false)
      expect(@song.quantity).to eq(1)
    end
    it "should be able to sell regardless of quantity" do
      result = @song.sell 99
      expect(result).to eq(true)
    end  

    it "should not change quantity on sell" do
      expect(@song.quantity).to eq(1)
    end  
  end  

end