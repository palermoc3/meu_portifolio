class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]

  # GET /purchases or /purchases.json
  def index
    @purchases = current_user.purchases
  end

  # GET /purchases/1 or /purchases/1.json
  def show; end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit; end

  # POST /purchases or /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.save
      render json: @purchase, status: :created, location: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purchases/1
  def update
    if @purchase.update(purchase_params)
      render json: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchase.destroy!
  end

  def user_last_purchase
    @last_purchase = current_user.purchases.where(closed: false).order(created_at: :desc).first
    redirect_to @last_purchase
  end

  def close
    @purchase = Purchase.find(params[:id])
    @purchase.update(closed: true)
    new_purchase = current_user.purchases.create(
      closed: false,
      paid: false,
      price: 0.00,
      packageSize: 0.0,
      receive: false
    )
    redirect_to new_payment_path(purchase_id: @purchase.id, price: @purchase.price)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:user_id, :price, :paid, :packageSize, :receive, :closed)
  end
end
