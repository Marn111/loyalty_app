FactoryBot.define do
  factory :purchase do
    user_id   { 1 }
    amount    { 200.0 }
    currency  { "SGD" }
    items     { [{"product_name"=> "Desk", "qty"=> "1", "amount"=> "200"}] }
    ordered_from  { "Singapore" }
  end
end
