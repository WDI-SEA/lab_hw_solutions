module Class_List
  def Class_List.init(student_array)
    if !student_array
      student_array = []
    end

    pretty_array = student_array.inspect
    puts "The array of students: #{pretty_array}"

    Class_List.add_student student_array
  end

  def Class_List.add_student(student_array)
    puts "Would you like to add another student?"
    response = gets.chomp.downcase

    if response == "yes" || response == "y"
      puts "What is the student's name?"
      name = gets.chomp
      student_array.push name
      Class_List.init student_array
    else
      Class_List.list_summary student_array
    end
  end

  def Class_List.list_summary(student_array)
    student_array.each_with_index do |value, index|
      puts "The student at Index #{index} is #{value}"
    end

    Class_List.init student_array
  end
end