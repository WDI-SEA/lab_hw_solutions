module Bank

  def Bank.init(balance)

    if balance == 0 || balance == "0"
      balance = 5000
    end

    puts "Your current balance is $#{balance}"
    puts "What would you like to do? (deposit, withdraw, check_balance)"
    choice = gets.chomp.downcase

    Bank.send(choice.to_sym, balance)

  end

  def Bank.deposit(balance)
    puts "How much would you like to deposit?"
    deposit = gets.chomp.to_i
    balance += deposit
    Bank.init balance
  end

  def Bank.withdraw(balance)
    puts "How much would you like to withdraw?"
    deposit = gets.chomp.to_i
    balance -= deposit
    Bank.init balance
  end

  def Bank.check_balance(balance)
    puts "Your current balance is $#{balance}"
    Bank.init balance
  end
end