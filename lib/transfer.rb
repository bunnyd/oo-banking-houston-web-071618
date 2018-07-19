require 'pry'

class Transfer
  # your code here
  # acts as a space for a transaction between two instances of the bank account class.
  #you can't just transfer money to another account without the bank running checks first
  #check the validity of the accounts before the transaction occurs
  #should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have the money

  #Transfers start out in a "pending" status. They can be executed and go to a "complete" state. They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
      if !self.valid?
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      elsif @sender.balance > self.amount && @status == "pending"
        @sender.balance -= @amount
        @receiver.deposit(@amount)
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @sender.balance += @amount
      @receiver.balance -= @amount
    end
  end
end
