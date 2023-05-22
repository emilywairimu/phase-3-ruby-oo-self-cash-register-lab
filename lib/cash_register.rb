class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction_amount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction_amount = 0
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    quantity.times { self.items << item }
    self.last_transaction_amount = price * quantity
  end

  def apply_discount
    if self.discount > 0
      discount_amount = self.total * (self.discount.to_f / 100)
      self.total -= discount_amount.to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction_amount
  end
end

