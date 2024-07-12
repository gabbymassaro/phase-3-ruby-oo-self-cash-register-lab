require 'pry'

class CashRegister
  attr_accessor :total, :discount, :quantity, :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @quantity = quantity
    @items = []
    @transaction_list = []
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    quantity.times { @items << title }
    @transaction_list << { title: title, price: price, quantity: quantity }
  end

  def apply_discount
    if discount
      self.total *= 1 - (discount.to_f/100)
      self.total = self.total.to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
   last_transaction = @transaction_list[-1]
   last_item_price = last_transaction[:price] * last_transaction[:quantity]
   self.total -= last_item_price
  end
end