class Laptop < ActiveRecord::Base
  def available_laptops   
    if TransactionsController.new.check_if_laptop_is_available(id) == true then
      "#{item_name}"
    end
  end
  

  def test
    transactions = TransactionsController.new.index #List of all transactions
    
  end
end
