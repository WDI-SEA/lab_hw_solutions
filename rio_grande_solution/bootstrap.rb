#Require all classes
require 'pry'
require './lib/Item'
require './lib/Bluray'
require './lib/Book'
require './lib/Cd'
require './lib/DigitalItem'
require './lib/EBook'
require './lib/Movie'
require './lib/Song'
require './lib/ClothingItem'
require './lib/Shirt'
require './lib/Pants'

binding.pry

# Usage Example (in terminal)
#
# # irb
# # require './bootstrap.rb'
# # i = Item.new "item name",1.99

# # i.name
# output: item name

# # i.quantity
# output: 0

# # i.sell 2
# output: false

# # i.stock 2
# output: true

# # i.quantity
# output: 2

# # i.sell 2
# output: true

# # i.quantity
# output: 0