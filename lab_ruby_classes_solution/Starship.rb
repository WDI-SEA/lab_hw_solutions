class Starship
	attr_reader :current_speed
	attr_accessor :top_speed

	def initialize (model, owner_name)
		@model = model
		@owner_name = owner_name
		@top_speed = 0
		@current_speed = 0
	end

	def set_top_speed (speed)
		@top_speed = speed
	end

	def get_top_speed
		@top_speed
	end

	def accelerate_to(speed)
		if (speed <= @top_speed)
			@current_speed = speed
		end
	end
end

myShip = Starship.new("Nostromo", "Ellen Ripley")
myShip.set_top_speed(500)
myShip.accelerate_to(1000)
puts myShip.current_speed

myShip.accelerate_to(300)
puts myShip.current_speed
