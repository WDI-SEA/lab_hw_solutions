require_relative 'spec_helper'
require_relative '../lib/EBook'

describe EBook do

  before(:context) do
    #initlize item
    @ebook = EBook.new("Book Title",12.99)
  end

describe "Initialization" do
    #check that it is an instance of EBook
    it "is an instance of the EBook class" do
      expect(@ebook).to be_instance_of(EBook)
    end

    #check that it is an extended from Item
    it "is an instance of the DigitalItem class" do
      expect(@ebook).to be_kind_of(DigitalItem)
    end    

    #check that it is an extended from Item
    it "is an instance of the Item class" do
      expect(@ebook).to be_kind_of(Item)
    end

    #check inilization
    it "is assigned a name" do
      expect(@ebook.name).to eq("Book Title")
    end
    it "is assigned a price" do
      expect(@ebook.price).to eq(12.99)
    end

    it "should be able to be initalized with a download_size" do
      item2 = EBook.new("Digital Item2",2.99,11.22)
      expect(item2.name).to eq("Digital Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.download_size).to eq(11.22)
      expect(item2.ship_price).to eq(false)
    end      
  end

  #check getters and setters
  describe "Accessors" do
    it "should be able to get quantity. Should default to 1." do
      expect(@ebook.quantity).to eq(1)
    end
    it "should be able to get and set name" do
      @ebook.name="New Title"
      expect(@ebook.name).to eq("New Title")
    end   
    it "should be able to get and set price" do
      @ebook.price=44.99
      expect(@ebook.price).to eq(44.99)
    end   
    it "should be able to get and set description" do
      expect(@ebook.description).to eq("")
      @ebook.description="test"
      expect(@ebook.description).to eq("test")
    end    

    it "should be able to get and set author" do
      expect(@ebook.author).to eq("")
      @ebook.author="My Author"
      expect(@ebook.author).to eq("My Author")
    end  

    it "should be able to get and set pages" do
      expect(@ebook.pages).to eq(0)
      @ebook.pages=99
      expect(@ebook.pages).to eq(99)
    end     
  end

  describe "Methods" do
    it "should not change quantity on stock" do
      result = @ebook.stock 5
      expect(result).to eq(false)
      expect(@ebook.quantity).to eq(1)
    end
    it "should be able to sell regardless of quantity" do
      result = @ebook.sell 99
      expect(result).to eq(true)
    end  

    it "should not change quantity on sell" do
      expect(@ebook.quantity).to eq(1)
    end  
  end  

end