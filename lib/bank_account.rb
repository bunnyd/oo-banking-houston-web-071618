require 'pry'

class BankAccount

  attr_reader :name, :display_balance
  attr_accessor :status, :balance

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    self.balance += money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" && self.balance > 0
      true
    else
      false
    end
  end

  def close_account
    self.status = "closed"
  end

end
