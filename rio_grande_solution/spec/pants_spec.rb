require_relative 'spec_helper'
require_relative '../lib/Pants'

describe Pants do
  before(:context) do
    #initlize item
    @pants = Pants.new("Item Name",12.99)
  end

  describe "Initialization" do
    it "is an instance of the Pants class" do
      expect(@pants).to be_instance_of(Pants)
    end

    #check that it is an extended from ClothingItem
    it "is an instance of the ClothingItem class" do
      expect(@pants).to be_kind_of(ClothingItem)
    end

    #check that it is an extended from Item
    it "is an instance of the Item class" do
      expect(@pants).to be_kind_of(Item)
    end

    it "is assigned a name" do
      expect(@pants.name).to eq("Item Name")
    end
    it "is assigned a price" do
      expect(@pants.price).to eq(12.99)
    end

    it "should be able to be initalized with a weight" do
      item2 = Item.new("Generic Item2",2.99,2.2)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.weight).to eq(2.2)
    end
  end

  describe "Accessors" do
    it "should be able to get sizes. Should default to empty array" do
      expect(@pants.sizes).to match_array([])
    end
    it "should be able to get quantity. Should default to 0." do
      expect(@pants.quantity).to eq(0)
    end
    it "should be able to get and set name" do
      @pants.name="New Name"
      expect(@pants.name).to eq("New Name")
    end
    it "should be able to get and set price" do
      @pants.price=44.99
      expect(@pants.price).to eq(44.99)
    end
    it "should be able to get and set description" do
      expect(@pants.description).to eq("")
      @pants.description="test"
      expect(@pants.description).to eq("test")
    end
    it "should be able to get and set weight and default to 0" do
      expect(@pants.weight).to eq(0)
      @pants.weight=4
      expect(@pants.weight).to eq(4)
    end
  end

  describe "Methods" do

    #stock
    it "should be able to stock a specific item size" do
      result = @pants.stock 5,"small"
      expect(result).to eq(true)
      expect(@pants.quantity("small")).to eq(5)
      expect(@pants.quantity).to eq(5)
    end
    it "should add a size when stocking" do
      expect(@pants.sizes).to match_array(["small"])
    end
    it "should be able to stock a size without it interfering with other sizes" do
      result = @pants.stock 2,"large"
      expect(result).to eq(true)
      expect(@pants.quantity("small")).to eq(5)
      expect(@pants.quantity("large")).to eq(2)
      expect(@pants.quantity).to eq(7)
    end

    #sell
    it "should be able to sell a specific item size if there are enough items" do
      result = @pants.sell 2,"small"
      expect(result).to eq(true)
      expect(@pants.quantity("small")).to eq(3)
      expect(@pants.quantity).to eq(5)
    end

    it "should not be able to sell a specific item size if there are not enough items" do
      result = @pants.sell 88,"large"
      expect(result).to eq(false)
      expect(@pants.quantity("large")).to eq(2)
      expect(@pants.quantity).to eq(5)
    end

    #return
    it "should be able to return a size without it interfering with other sizes" do
      result = @pants.return 11,"large"
      expect(result).to eq(true)
      expect(@pants.quantity("small")).to eq(3)
      expect(@pants.quantity("large")).to eq(13)
    end
    it "should be able to get the correct quantity for all items" do
        expect(@pants.quantity).to eq(16)
    end

    #returns

    it "get shipping weight with ship_price" do
      expect(@pants.ship_price).to eq(4 * 1.2)
    end
  end

  describe "Class Variables" do
    it "should have a ship_price_per_oz value of 1.2" do
      expect(@pants.ship_price_per_oz).to eq(1.2)
    end
  end
end