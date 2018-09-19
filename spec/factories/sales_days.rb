FactoryBot.define do
  factory :sales_day do
    sales_date { "2018-09-19" }
    amount_spent { 1 }
    amount_sold { 1 }
    market_id { nil }
  end
end
