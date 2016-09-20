require_relative 'account'
require 'pp'

class Ui

  def initialize
    @account = Account.new
    @statement = @account.statement
  end

  def welcome
    puts "Please enter your name"
    @name = STDIN.gets.chop
    puts "Welcome to 🐷  PiggyBank 🐷   #{@name}"
    interactive_menu
  end

  def print_menu
    puts "1. ⬇️  Make Withdrawl ⬇️"
    puts "2. ⬆️  Make Deposit ⬆️"
    puts "3. Print Statement"
    puts "4. Last Transaction"
    puts "9. Exit"
  end

  def process(selection)
    case selection
    when "1"
      print "Taking you to the ATM"
      dot_counter
      withdrawl_ui
    when "2"
      print "Taking you to the 🐷 PiggyBank 🐷  "
      dot_counter
      deposit_ui
    when "3"
      print "Printing your 🐷 PiggyBank 🐷  Statement"
      dot_counter
      print_balance
    when "4"
      print "Loading your most recent transaction"
      dot_counter
      last_transaction
    when "9"
      exit_countdown
    else
      puts "I'm not sure what you mean, please try again"
    end
  end

  def dot_counter
    print "."
    2.downto(1) do |i|
      print "."
      sleep 1
    end
    puts "."
  end

  def exit_countdown
    puts "The program is quitting..."
    3.downto(1) do |i|
      puts "#{i}"
      sleep 1
    end
    exit
  end

  def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def print_balance
    puts"********** 🐷 PiggyBank 🐷  Account Balance **********"
    puts"*"*48
    # width = @statement.transactions.flatten.max.to_s.size+2
    @statement.transactions.each { |x|
      puts x.join("\t")
    }
    puts"*"*48
    # return @statement.transactions
  end

  def deposit_ui
    puts"How much would you like to deposit at 🐷 PiggyBank🐷  "
    amount = STDIN.gets.chop
    @account.credit(amount.to_i)
    puts"*"*40
    puts"£#{amount} has been added to your account."
    puts"Your balance is #{@account.balance}."
    puts"*"*40
  end

  def withdrawl_ui
    puts"How much would you like to withdraw from your 🐷 PiggyBank🐷  "
    amount = STDIN.gets.chop
    @account.debit(amount.to_i)
    puts"*"*40
    puts"£#{amount} has been withdrawn from your account."
    puts"Your balance is #{@account.balance}."
    puts"*"*40
  end

  def last_transaction
    puts"*"*40
    puts"Your last transaction:"
    puts @statement.transactions[0].join("\t")
    puts @statement.transactions.last.join("\t")
    # puts @statement.transactions.last.inspect
    puts"*"*40
  end
end

ui = Ui.new

ui.welcome
