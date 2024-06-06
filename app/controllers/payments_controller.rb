# frozen_string_literal: true

class PaymentsController < ApplicationController
  def new
    @purchase = Purchase.find(params[:purchase_id])
    @price = params[:price]
  end

  def create
    customer = Stripe::Customer.create({
                                         email: params[:stripeEmail],
                                         source: params[:stripeToken]
                                       })

    # Convertendo o valor de params[:amount] para um número inteiro
    amount_in_cents = params[:amount].to_i

    Stripe::Charge.create({
                            customer: customer.id,
                            amount: amount_in_cents,
                            description: params[:description],
                            currency: 'brl'
                          })
  rescue Stripe::CardError
    redirect_to new_payment_path
  end
end
