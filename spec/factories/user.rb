FactoryBot.define do
  factory :user do
    name            { "Jhon" }
    birthday        { "01-07-1995" }
    points          { 0.0 }
    origin_country  { "Singapore" }
  end
end
