class Transfer
    
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  # can check that both accounts are valid 
  # calls on the sender and receiver's #valid? methods
  def valid?
    @sender.valid? && @receiver.valid?
  end

      # can execute a successful transaction between two accounts
      # each transfer can only happen once
      # rejects a transfer if the sender does not have enough funds (does not have a valid account)

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && sender.balance > amount && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end
  
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end


end