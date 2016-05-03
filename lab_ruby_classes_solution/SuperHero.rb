class SuperHero
	def initialize (first_name, last_name)
		@first_name = first_name
		@last_name = last_name
	end

	def super_punch
		"WHAM!!!"
	end
end

myHero = SuperHero.new("Dudely", "Dude")
puts myHero.super_punch
