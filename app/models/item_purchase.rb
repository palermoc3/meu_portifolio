class ItemPurchase < ApplicationRecord
  belongs_to :purchase
  belongs_to :product

  before_validation :set_default_values, on: :create
  after_update :destroy_if_quantity_zero
  after_save :update_purchase_total_price

  def update_purchase_total_price
    purchase.update_total_price
  end

  private

  def set_default_values
    self.quantity = 1
    self.value = product.valueSell if product
  end

  def destroy_if_quantity_zero
    destroy if quantity.zero?
  end
end
