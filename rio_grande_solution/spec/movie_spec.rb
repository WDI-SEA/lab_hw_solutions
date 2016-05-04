require_relative 'spec_helper'
require_relative '../lib/Movie'

describe Movie do

  before(:context) do
    #initlize item
    @movie = Movie.new("Movie Title",12.99)
  end

describe "Initialization" do
    #check that it is an instance of Movie
    it "is an instance of the Movie class" do
      expect(@movie).to be_instance_of(Movie)
    end

    #check that it is an extended from Item
    it "is an instance of the DigitalItem class" do
      expect(@movie).to be_kind_of(DigitalItem)
    end    

    #check that it is an extended from Item
    it "is an instance of the Item class" do
      expect(@movie).to be_kind_of(Item)
    end

    #check inilization
    it "is assigned a name" do
      expect(@movie.name).to eq("Movie Title")
    end
    it "is assigned a price" do
      expect(@movie.price).to eq(12.99)
    end

    it "should be able to be initalized with a download_size" do
      item2 = Movie.new("Digital Item2",2.99,11.22)
      expect(item2.name).to eq("Digital Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.download_size).to eq(11.22)
      expect(item2.ship_price).to eq(false)
    end      
  end

  #check getters and setters
  describe "Accessors" do
    it "should be able to get quantity. Should default to 1." do
      expect(@movie.quantity).to eq(1)
    end
    it "should be able to get and set name" do
      @movie.name="New Title"
      expect(@movie.name).to eq("New Title")
    end   
    it "should be able to get and set price" do
      @movie.price=44.99
      expect(@movie.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@movie.description).to eq("")
      @movie.description="test"
      expect(@movie.description).to eq("test")
    end    

    it "should be able to get and set run_time" do
      expect(@movie.run_time).to eq("")
      @movie.run_time="2:01"
      expect(@movie.run_time).to eq("2:01")
    end  

    it "should be able to get and set director" do
      expect(@movie.director).to eq("")
      @movie.director="John Doe"
      expect(@movie.director).to eq("John Doe")
    end  

    it "should be able to get and set producer" do
      expect(@movie.producer).to eq("")
      @movie.producer="John Doe2"
      expect(@movie.producer).to eq("John Doe2")
    end     
  end

  describe "Methods" do
    it "should not change quantity on stock" do
      result = @movie.stock 5
      expect(result).to eq(false)
      expect(@movie.quantity).to eq(1)
    end
    it "should be able to sell regardless of quantity" do
      result = @movie.sell 99
      expect(result).to eq(true)
    end  

    it "should not change quantity on sell" do
      expect(@movie.quantity).to eq(1)
    end  
  end  

end