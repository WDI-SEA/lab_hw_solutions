class Robot
	def initialize(name, purpose)
		@name = name
		@purpose = purpose
	end

	def greet
		"beep boop"
	end
end

puts Robot.new("Robbie", "Mass Destruction").greet
