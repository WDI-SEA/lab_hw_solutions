require_relative 'spec_helper'
require_relative '../lib/Book'

describe Book do

  before(:context) do
    #initlize item
    @book = Book.new("Book Title",12.99)
  end

describe "Initialization" do
    #check that it is an instance of Book
    it "is an instance of the Book class" do
      expect(@book).to be_instance_of(Book)
    end

    #check that it is an extended from Item
    it "is an instance of the Item class" do
      expect(@book).to be_kind_of(Item)
    end

    #check inilization
    it "is assigned a name" do
      expect(@book.name).to eq("Book Title")
    end
    it "is assigned a price" do
      expect(@book.price).to eq(12.99)
    end

    it "should be able to be initalized with a weight" do
      item2 = Book.new("Generic Item2",2.99,2.2)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.weight).to eq(2.2)
    end
  end

  #check getters and setters
  describe "Accessors" do
    it "should be able to get quantity" do
      expect(@book.quantity).to eq(0)
    end
    it "should be able to get and set name" do
      @book.name="New Title"
      expect(@book.name).to eq("New Title")
    end
    it "should be able to get and set price" do
      @book.price=44.99
      expect(@book.price).to eq(44.99)
    end
    it "should be able to get and set description" do
      expect(@book.description).to eq("")
      @book.description="test"
      expect(@book.description).to eq("test")
    end

    it "should be able to get and set author" do
      expect(@book.author).to eq("")
      @book.author="My Author"
      expect(@book.author).to eq("My Author")
    end

    it "should be able to get and set pages" do
      expect(@book.pages).to eq(0)
      @book.pages=99
      expect(@book.pages).to eq(99)
    end
  end

end