
u = User.create(
  email: "test2@test.com", 
  password: "password", 
  password_confirmation: "password"
  )

  10.times do 
    Customer.create(
      first_name: Faker::Name.first_name, 
      last_name: Faker::Name.last_name, 
      email: Faker::Internet.email, 
      phone: Faker::PhoneNumber.phone_number, 
      user_id: u.id 
      ) 
    end 
    # will create an instance stored in a variable to not guess the id. 
  

  puts "Test User: 'test2@test.com' - 'password' with 10 customers. "