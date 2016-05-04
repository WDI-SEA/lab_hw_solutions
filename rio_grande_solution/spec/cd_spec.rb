require_relative 'spec_helper'
require_relative '../lib/Cd'

describe Cd do

  before(:context) do
    #initlize item
    @cd = Cd.new("CD Title",12.99)
  end

  describe "Initialization" do
    #check that it is an instance of Bluray
    it "is an instance of the Cd class" do
      expect(@cd).to be_instance_of(Cd)
    end

    #check that it is an extended from Item
    it "is an instance of the Item class" do
      expect(@cd).to be_kind_of(Item)
    end

    #check inilization
    it "is assigned a name" do
      expect(@cd.name).to eq("CD Title")
    end
    it "is assigned a price" do
      expect(@cd.price).to eq(12.99)
    end

    it "should be able to be initalized with a weight" do
      item2 = Cd.new("Generic Item2",2.99,2.2)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.weight).to eq(2.2)
    end
  end

  #check getters and setters
  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@cd.quantity).to eq(0)
    end
    it "should be able to get and set name" do
      @cd.name="New Title"
      expect(@cd.name).to eq("New Title")
    end
    it "should be able to get and set price" do
      @cd.price=44.99
      expect(@cd.price).to eq(44.99)
    end
    it "should be able to get and set description" do
      expect(@cd.description).to eq("")
      @cd.description="test"
      expect(@cd.description).to eq("test")
    end

    it "should be able to get and set run_time" do
      expect(@cd.run_time).to eq("")
      @cd.run_time="2:01"
      expect(@cd.run_time).to eq("2:01")
    end

    it "should be able to get and set artist" do
      expect(@cd.artist).to eq("")
      @cd.artist="John Doe"
      expect(@cd.artist).to eq("John Doe")
    end

    it "should be able to get and set tracks" do
      expect(@cd.tracks).to eq(0)
      @cd.tracks=4
      expect(@cd.tracks).to eq(4)
    end
  end

end