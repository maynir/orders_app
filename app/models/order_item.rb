class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  validates_associated :order, :menu_item
end
