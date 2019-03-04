User.destroy_all
Loan.destroy_all
Request.destroy_all

# Users

test_user = User.new(
  first_name: "Daniel",
  last_name: "Trujillo",
  email: "daniel@gmail.com",
  password: "123456",
  id_type: "Passport",
  id_number: "123AF234",
  city: "Paris",
  address: "16 Villa Gaudelet"
)

test_user.remote_photo_url = "https://res.cloudinary.com/truxxu/image/upload/v1551457914/babby.jpg"

test_user.save

test_user2 = User.new(
  first_name: "Julián",
  last_name: "Barreiro",
  email: "julian@gmail.com",
  password: "123456",
  id_type: "Driver License",
  id_number: "123AF234",
  city: "Hannover",
  address: "Gellertstr. 21"
)

test_user2.remote_photo_url = "https://res.cloudinary.com/truxxu/image/upload/v1551457914/babby.jpg"

test_user2.save

test_user3 = User.new(
  first_name: "Leonardo",
  last_name: "Nieto",
  email: "leonardo@gmail.com",
  password: "123456",
  id_type: "Passport",
  id_number: "123AF234",
  city: "Bogota",
  address: "Cl. 97 #71c 21"
)

test_user3.remote_photo_url = "https://res.cloudinary.com/truxxu/image/upload/v1551457914/babby.jpg"

test_user3.save

# Loans

test_loan = Loan.create(
  title: "Loan King",
  description: "Medium-term loans with the lowest interest",
  user_id: test_user.id,
  min_amount: 100,
  max_amount: 500,
  interest_rate: 1.2,
  payment_frequency: "monthly",
  payment_period: 6
)

test_loan2 = Loan.create(
  title: "Professional Money Lenders",
  description: "Need money fast? We can help you :^)",
  user_id: test_user2.id,
  min_amount: 100,
  max_amount: 2000,
  interest_rate: 20,
  payment_frequency: "monthly",
  payment_period: 1
)

test_loan3 = Loan.create(
  title: "Instacash",
  description: "Look no more, you have found the best deal",
  user_id: test_user3.id,
  min_amount: 50,
  max_amount: 1000,
  interest_rate: 3.5,
  payment_frequency: "monthly",
  payment_period: 12
)

# Requests

test_request = Request.create(
  loan_start: "2019-03-15",
  loan_end: "2019-09-15",
  user_id: test_user.id,
  loan_id: test_loan3.id,
  requested_amount: 650
)

test_request2 = Request.create(
  loan_start: "2019-03-15",
  loan_end: "2019-05-15",
  user_id: test_user2.id,
  loan_id: test_loan.id,
  requested_amount: 500
)

test_request3 = Request.create(
  loan_start: "2019-03-15",
  loan_end: "2019-04-15",
  user_id: test_user3.id,
  loan_id: test_loan2.id,
  requested_amount: 1800
)
