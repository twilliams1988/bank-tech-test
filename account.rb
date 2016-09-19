require_relative 'statement'

class Account

  DEFAULT_BALANCE = 0

  attr_reader :balance, :statement

  def initialize
    @balance = DEFAULT_BALANCE
    @statement = Statement.new
  end

  def credit(amount)
    @balance += amount
    @statement.update_statement(amount, nil, @balance)
  end

  def debit(amount)
    @balance -= amount
    @statement.update_statement(nil, amount, @balance)
  end

end
