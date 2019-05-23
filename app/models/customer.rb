class Customer < ApplicationRecord
  belongs_to :user

  #Class Methods
  def self.all_customers(id) 
    Customer.find_by_sql("
    SELECT * 
    FROM customers AS c 
    WHERE #{id} = c.user_id 
    ")
  end 
  #need to interpolate because sql needs to read the user_id as a int and not just read it as a text: user_id. 

  #Class - set_customer 
  def self.single_customer(user_id, id)
    Customer.find_by_sql(["
    SELECT * 
    FROM customers AS c 
    WHERE c.id = ? AND c.user_id = ? 
    ", id, user_id]).first 
  end 
  #needs to be in order! customer id is being passed first, then user. 


  #Intance Method for Full Name 
  def full_name 
    "#{self.first_name} #{self.last_name}"
  end 
end
