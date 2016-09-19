class Statement

  attr_reader :transactions

  def initialize
    @transactions = [["Date    ", "Credit", "Debit", "Balance"]]
  end

  def update_statement(credit, debit, balance)
    @transactions << [transaction_date, credit, debit, balance]
  end

  def transaction_date
    Time.now.strftime("%d/%m/%y")
  end
end
