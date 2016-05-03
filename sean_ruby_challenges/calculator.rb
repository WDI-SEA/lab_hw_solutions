module Calc

  def Calc.init(last_result)

    if last_result == 0 || last_result == "0" || !last_result
      last_result = 0
    end

    puts "What calculation would you like to do? (add, subtract, multiply, divide)"
    calculation = gets.chomp

    # check for quit command after calc choice
    if calculation.downcase == "q" || calculation.downcase == "quit"
      return
    end

    # check for non-supported input
    if calculation.downcase != 'add' && calculation.downcase != "subtract" && calculation.downcase != "multiply" && calculation.downcase != "divide"
      puts "Please use a valid selection"
      Calc.init 0
    end

    puts "Number 1 Choice"
    puts "Use previous result? (y or n)"
    prev_result = gets.chomp

    # check for quit command after num1
    if prev_result.downcase == "q" || prev_result.downcase == "quit"
      return
    end

    if prev_result.downcase == "y" || prev_result.downcase == "yes"
      num1 = last_result
    elsif prev_result.downcase == 'n' || prev_result.downcase == "no"
      puts "Please enter the first number?"
      num1 =  gets.chomp

      # check for quit command after num1
      if num1.downcase == "q" || num1.downcase == "quit"
        return
      end

    else
      puts "Please use a valid selection"
      Calc.init last_result
    end

    puts "Number 2 Choice"
    puts "Use previous result? (y or n)"
    prev_result = gets.chomp

    if prev_result.downcase == "y" || prev_result.downcase == "yes"
      num2 = last_result
    elsif prev_result.downcase == 'n' || prev_result.downcase == "no"
      puts "Please enter the second number"
      num2 =  gets.chomp

      # check for quit command after num2
      if num2.downcase == "q" || num2.downcase == "quit"
        return
      end
    else
      puts "Please use a valid selection"
      Calc.init last_result
    end

    # Dynamic method calling!
    # Sends and execution call via ".send()" with the converted
    # calculation string to a symbol. Puts the return of whatever
    # function is called
    result = Calc.send(calculation.downcase.to_sym, num1.to_i, num2.to_i)
    puts "Result: #{result}"
    Calc.init result
  end

  def Calc.add(num1, num2)
    num1 + num2
  end

  def Calc.subtract(num1, num2)
    num1 - num2
  end

  def Calc.multiply(num1, num2)
    num1 * num2
  end

  def Calc.divide(num1, num2)
    num1 / num2
  end
end