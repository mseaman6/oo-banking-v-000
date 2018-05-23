class Transfer

  attr_accessor :sender, :receiver
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
    if self.valid?
      self.sender.deposit(-amount)
    else
      "The transaction has been rejected."
  end

end
