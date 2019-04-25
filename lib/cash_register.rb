require 'pry'

class CashRegister
  attr_accessor :discount, :total, :items, :income
  
  def initialize(discount_amount=nil)
    @total = 0 
    @discount = discount_amount
  end 
 
  def add_item(item_name, cash_given, item_quantity = 1)
    @total += (cash_given * item_quantity)
    @income = (cash_given * item_quantity)

    if @items == nil
      @items = []
      @items << item_name
    else
      item_quantity.times{@items.push(item_name)}
    end 

  end 
  
  def apply_discount
    if @discount.nil?  
      "There is no discount to apply."
    else
      @total = @total * (1-@discount/100.0)
      "After the discount, the total comes to $#{total.to_i}."
    end 
  end
  
  def void_last_transaction
    @total -= @income
  end
  
end 

