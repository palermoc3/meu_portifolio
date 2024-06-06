# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :user
  has_many :item_purchases

  def update_total_price
    update_column(:price, item_purchases.sum(:value))
  end

  private

  def update_total_value_if_closed_changed_to_true
    return unless closed == true

    user.purchases.create(closed: false, paid: false, price: 0.00, packageSize: 0.0, receive: false)
    update_total_value
  end
end
