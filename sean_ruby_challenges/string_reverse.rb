module String_Reverse
  def String_Reverse.init

    puts "Enter string to be reversed"
    string = gets.chomp

    end_loop = string.length
    new_string = ""
    
    while end_loop > 0 do
      end_loop -= 1
      new_string += string[end_loop]
    end

    new_string 
  end
end