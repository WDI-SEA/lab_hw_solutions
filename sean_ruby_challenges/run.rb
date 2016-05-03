require './calculator.rb'
require './string_reverse.rb'
require './bank.rb'
require './guessing_game.rb'
require './class_list.rb'

def init

  puts "What item would you like to use? (calculator, string-reverse, bank, guessing-game, class-list)"
  choice = gets.chomp.downcase

  if choice == "calculator"
    Calc.init 0
  elsif choice == "string-reverse"
    puts String_Reverse.init
    init
  elsif choice == "bank"
    Bank.init 0
  elsif choice == "guessing-game"
    Guessing_Game.init
  elsif choice == "class-list"
    Class_List.init nil
  elsif choice == "q" || choice == "quit"
    return
  else
    puts "Please choose a valid item"
    init
  end
end

init