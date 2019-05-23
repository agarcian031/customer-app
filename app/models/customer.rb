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

  #Class - create_customer 
  #p - params 
  def self.create_customer(p, user_id)
    Customer.find_by_sql(["
      INSERT INTO customers (first_name, last_name, email, phone, user_id, created_at, updated_at)
      VALUES (:first, :last, :email, :phone, :user_id, :created_at, :updated_at);
    ", {
      first: p[:first_name], 
      last: p[:last_name], 
      email: p[:email],
      phone: p[:phone],
      user_id: user_id, 
      created_at: DateTime.now, 
      updated_at: DateTime.now
    }])
  end 

  #Class - update customer 
  def self.update_customer(customer_id, p)
    Customer.find_by_sql(["
      UPDATE customers AS c 
      SET first_name = ?, last_name = ?, email = ?, phone = ?, updated_at = ? 
      WHERE c.id = ? 
    ", p[:first_name], p[:last_name], p[:email], p[:phone], DateTime.now, customer_id])
  end 

  #CLASS - DELETE customer 
  def self.delete_customer(customer_id)
    Customer.find_by_sql(["
      DELETE FROM customers AS c 
      WHERE c.id = ? 
    ", customer_id])
  end 

  #Intance Method for Full Name 
  def full_name 
    "#{self.first_name} #{self.last_name}"
  end 
end
