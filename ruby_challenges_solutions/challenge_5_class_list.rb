
def class_list
	students = []
	is_running = true

	while is_running
		puts "Would you like to add another student?"
		add_student = gets.chomp
		if add_student == 'yes'
			puts "What is the student's name?"
			new_student = gets.chomp
			students << new_student
			puts "The array of students now looks like: " + students.inspect
		else
			is_running = false
			puts "Here is a summary of your student array:"
			students.each_with_index do |student, index|
				puts "The student at index #{index} is #{student}"
			end
		end
	end
end

class_list