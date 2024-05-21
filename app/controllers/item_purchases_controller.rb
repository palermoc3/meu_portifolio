class ItemPurchasesController < ApplicationController
  before_action :set_item_purchase, only: %i[ show edit update destroy ]

  # GET /item_purchases or /item_purchases.json
  def index
    @item_purchases = ItemPurchase.all
  end

  # GET /item_purchases/1 or /item_purchases/1.json
  def show
  end

  # GET /item_purchases/new
  def new
    @item_purchase = ItemPurchase.new
  end

  # GET /item_purchases/1/edit
  def edit
  end

  # POST /item_purchases or /item_purchases.json
  def create
    @item_purchase = ItemPurchase.new(item_purchase_params)

    respond_to do |format|
      if @item_purchase.save
        format.html { redirect_to item_purchase_url(@item_purchase), notice: "Item purchase was successfully created." }
        format.json { render :show, status: :created, location: @item_purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_purchases/1 or /item_purchases/1.json
  def update
    respond_to do |format|
      if @item_purchase.update(item_purchase_params)
        format.html { redirect_to item_purchase_url(@item_purchase), notice: "Item purchase was successfully updated." }
        format.json { render :show, status: :ok, location: @item_purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_purchases/1 or /item_purchases/1.json
  def destroy
    @item_purchase.destroy!

    respond_to do |format|
      format.html { redirect_to item_purchases_url, notice: "Item purchase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_purchase
      @item_purchase = ItemPurchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_purchase_params
      params.require(:item_purchase).permit(:purchase_id, :product_id, :value, :quantity)
    end
end
