require_relative 'spec_helper'
require_relative '../lib/Bluray'

describe Bluray do

  before(:context) do
    #initlize item
    @bluray = Bluray.new("Movie Title",12.99)
  end

describe "Initialization" do
    #check that it is an instance of Bluray
    it "is an instance of the Bluray class" do
      expect(@bluray).to be_instance_of(Bluray)
    end

    #check that it is an extended from Item
    it "is an instance of the Item class" do
      expect(@bluray).to be_kind_of(Item)
    end

    #check inilization
    it "is assigned a name" do
      expect(@bluray.name).to eq("Movie Title")
    end
    it "is assigned a price" do
      expect(@bluray.price).to eq(12.99)
    end

    it "should be able to be initalized with a weight" do
      item2 = Bluray.new("Generic Item2",2.99,2.2)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.weight).to eq(2.2)
    end
  end

  #check getters and setters
  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@bluray.quantity).to eq(0)
    end
    it "should be able to get and set name" do
      @bluray.name="New Title"
      expect(@bluray.name).to eq("New Title")
    end
    it "should be able to get and set price" do
      @bluray.price=44.99
      expect(@bluray.price).to eq(44.99)
    end
    it "should be able to get and set description" do
      expect(@bluray.description).to eq("")
      @bluray.description="test"
      expect(@bluray.description).to eq("test")
    end

    it "should be able to get and set run_time" do
      expect(@bluray.run_time).to eq("")
      @bluray.run_time="2:01"
      expect(@bluray.run_time).to eq("2:01")
    end

    it "should be able to get and set director" do
      expect(@bluray.director).to eq("")
      @bluray.director="John Doe"
      expect(@bluray.director).to eq("John Doe")
    end

    it "should be able to get and set producer" do
      expect(@bluray.producer).to eq("")
      @bluray.producer="John Doe2"
      expect(@bluray.producer).to eq("John Doe2")
    end
  end

end