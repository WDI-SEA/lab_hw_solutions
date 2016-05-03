

def guessing_game
	number_to_guess = rand(1..100)
	user_guess = nil
	tries = 0

	puts "Guess a number between 1 and 100"
	until user_guess == number_to_guess
		user_guess = gets.to_i
		tries += 1

		case user_guess <=> number_to_guess
		when -1
			puts "The number is higher than #{user_guess}. Guess again"
		when 1
			puts "The number is lower than #{user_guess}. Guess again"
		when 0
			puts "You got it in #{tries} tries!"
		end

		# if user_guess > number_to_guess
		# 	puts "The number is lower than #{user_guess}. Guess again"
		# elsif user_guess < number_to_guess
		# 	puts "The number is higher than #{user_guess}. Guess again"
		# else
		# 	puts "You got it in #{tries} tries!"
		# end
	end
end

guessing_game