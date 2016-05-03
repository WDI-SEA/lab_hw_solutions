class Die
	def initialize (no_of_sides)
		@no_of_sides = no_of_sides
		@rolls = [];
	end

	def roll
		theRoll = 1 + rand(@no_of_sides)
		@rolls.push(theRoll)
		theRoll
	end

	def get_rolls
		@rolls
	end
end

myDie = Die.new(4)

puts myDie.roll
puts myDie.roll
puts myDie.roll
puts myDie.roll
puts myDie.roll
puts myDie.roll
puts myDie.roll

puts ""

puts myDie.get_rolls.to_s
