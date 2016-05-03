module Guessing_Game

  def Guessing_Game.init

    count = 0

    ran_num = Random.new.rand(1..100)
    
    # Cheat - prints random number
    #puts ran_num

    puts "Guess a number between 1 and 100"
    guess = gets.chomp.to_i

    Guessing_Game.check guess, ran_num, count
  end

  def Guessing_Game.check(guess, ran_num, count)
    count += 1

    if guess > ran_num
      Guessing_Game.lower guess, ran_num, count
    elsif guess < ran_num
      Guessing_Game.higher guess, ran_num, count
    else
      Guessing_Game.equal guess, ran_num, count
    end
  end

  def Guessing_Game.lower(guess, ran_num, count)
    puts "The number is lower than #{guess}, guess again!"
    guess = gets.chomp.to_i

    Guessing_Game.check guess, ran_num, count
  end

  def Guessing_Game.higher(guess, ran_num, count)
    puts "The number is higher than #{guess}, guess again!"
    guess = gets.chomp.to_i

    Guessing_Game.check guess, ran_num, count
  end

  def Guessing_Game.equal(guess, ran_num, count)
    puts "You guessed correctly! You win!!!"
    puts "It took #{count} guesses!"
    return
  end
end