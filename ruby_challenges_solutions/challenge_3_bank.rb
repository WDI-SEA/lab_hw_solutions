# Create a prompt that asks the user if they would like 
# to display their balance, withdraw or deposit. 
# Write three methods to perform these calculations and
# output the result to the user.

def balance(balance)
	puts "Your current balance is " + sprintf("%0.02f", balance)
end

def withdrawl(balance, withdrawl_amount)
	balance - withdrawl_amount
end

def deposit(balance, deposit_amount)
	balance + deposit_amount
end

# puts balance(5000.00)
# puts withdrawl(5000.00, 1000.00)
# puts deposit(5000.00, 2000.00)

def run_bank(balance)
	keep_running = true

	while keep_running
		puts "What would you like to do? (deposit, withdraw, check_balance), q to quit"
		choice = gets.chomp
		
		case choice
		when 'deposit'
			puts "How much would you like to deposit?"
			deposit_amount = gets.to_f
			balance = deposit(balance, deposit_amount)
			balance(balance)
		when 'withdraw'
			puts "How much would you like to withdraw?"
			withdraw_amount = gets.to_f
			balance = withdrawl(balance, withdraw_amount)
			balance(balance)
		when 'check_balance'
			balance(balance)
		when 'q'
			keep_running = false
		else
			puts "Invalid input, try again"
		end
	end
end

run_bank(5000.00)















