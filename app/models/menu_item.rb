class MenuItem < ApplicationRecord
  has_many :order_items, dependent: :destroy
end
