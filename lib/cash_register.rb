require 'pry'

class CashRegister
  attr_accessor :discount, :total, :items
  
  def initialize(discount_amount=nil)
    @total = 0 
    @discount = discount_amount
  end 
 
  def add_item(item_name, cash_given, item_quantity = 1)
    @total += (cash_given * item_quantity)

    if @items == nil
      binding.pry
      @items = []
      @items << item_name
    else
      binding.pry
      @items << item_name 
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
  
end 
describe 'CashRegister' do
  let(:cash_register) { CashRegister.new }
  let(:cash_register_with_discount) { CashRegister.new(20) }

  describe '#items' do
    it 'returns an array containing all items that have been added' do
      new_register = CashRegister.new
      new_register.add_item("eggs", 1.99)
      new_register.add_item("tomato", 1.76, 3)
      expect(new_register.items).to eq(["eggs", "tomato", "tomato", "tomato"])
    end
  end

  describe '#void_last_transaction' do
    it 'subtracts the last transaction from the total' do
      cash_register.add_item("tomato", 1.76)
      expect{cash_register.void_last_transaction}.to change{cash_register.total}.from(1.76).to(0.0)
    end
  end
end
