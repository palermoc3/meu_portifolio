# frozen_string_literal: true

class ItemPurchasesController < ApplicationController
  def destroy
    item_purchase = ItemPurchase.find(params[:id])
    purchase = item_purchase.purchase
    product = item_purchase.product
    purchase.update(price: purchase.price - (product.valueSell * item_purchase.quantity))
    item_purchase.destroy
    redirect_to purchase_path(purchase), notice: 'Item de compra apagado com sucesso.'
  end

  def growth
    item_purchase = ItemPurchase.find(params[:id])
    purchase = item_purchase.purchase
    product = item_purchase.product
    item_purchase.quantity += 1
    item_purchase.value += product.valueSell
    purchase.price += product.valueSell
    item_purchase.save
    purchase.save
    redirect_to purchase_path(item_purchase.purchase)
  end

  def reduction
    item_purchase = ItemPurchase.find(params[:id])
    purchase = item_purchase.purchase
    product = item_purchase.product
    item_purchase.quantity -= 1
    if item_purchase.quantity != 0
      item_purchase.value -= product.valueSell
      purchase.price -= product.valueSell
      item_purchase.save
      purchase.save
    else
      purchase.update(price: purchase.price - product.valueSell)
      item_purchase.destroy
    end
    redirect_to purchase_path(item_purchase.purchase)
  end
end
