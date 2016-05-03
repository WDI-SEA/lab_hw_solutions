# Create a simple calculator that first asks the user what method they would like to use (addition, subtraction, multiplication, division) and then asks the user for two numbers, returning the result of the method with the two numbers. Here is a sample prompt:

def prompt_for_numbers
	puts "What is number 1?"
	number1 = gets.to_f
	puts "What is number 2?"
	number2 = gets.to_f

	[number1, number2]
end

# puts prompt_for_numbers

def calculator
	puts "What calculation would you like to do? (add, sub, mult, div)"
	calculator_operation = gets.chomp
	
	case calculator_operation
	when 'add'
		numbers = prompt_for_numbers
		result = numbers[0] + numbers[1]
	when 'sub'
		numbers = prompt_for_numbers
		result = numbers[0] - numbers[1]
	when 'mult'
		numbers = prompt_for_numbers
		result = numbers[0] * numbers[1]
	when 'div'
		numbers = prompt_for_numbers
		if numbers[1] == 0
			puts "Divide by zero error"
			result = nil
		else
			result = numbers[0] / numbers[1]
		end
	else
		result = nil
	end

	if result
		puts "Your result is #{result}"
	else
		puts "Invalid operation"
	end
end

calculator










