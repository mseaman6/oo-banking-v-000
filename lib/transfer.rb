class Transfer

  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.sender.balance >= self.amount
      self.sender.deposit(-(self.amount))
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "The transaction has been rejected."
    end
  end

  def reverse_transfer
    if self.status = "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(-self.amount)
      self.status = "reversed"
    end
  end

end
