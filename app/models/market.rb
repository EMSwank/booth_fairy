class Market < ApplicationRecord
  belongs_to :user
  has_many :sales_days
end
