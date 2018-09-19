FactoryBot.define do
  factory :market do
    name Faker::Address.community
    street_address Faker::Address.street_address
    
  end
end