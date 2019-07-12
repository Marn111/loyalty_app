# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
users_data = [
  { name: 'Jhon', birthday: "01-01-1989", points: 0.0, origin_country: "singapore"},
  { name: 'Merry', birthday: "01-03-1990", points: 0.0, origin_country: "singapore" },
  { name: 'Rose', birthday: "01-06-1995", points: 0.0, origin_country: "singapore" },
  { name: 'Patrick', birthday: "01-06-1996", origin_country: "singapore" },
  { name: 'Gwan', birthday: "01-07-2000", origin_country: "thiland" },
]
users_data.each do |data|
  User.create!(data)
end

jhon = User.find_by_name("Jhon")
purchases_data = [
  {amount: "100", currency: "sgd", items: [{"product_name": "Body Wash", "qty": 3, "amount": 50}, {"product_name": "Shampoo", "qty": 2,  "amount": 50}], ordered_from: "singapore"},
  {amount: "200", currency: "sgd", items: [{"product_name": "Desk", "qty": 1, "amount": 200}], ordered_from: "thiland"}
]
jhon.purchases.create!(purchases_data)
