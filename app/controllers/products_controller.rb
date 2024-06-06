# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  def index
    @products = if params[:keyword].present?
                  Product.search(params[:keyword]).order(quantity: :desc).page(params[:page]).per(15)
                else
                  Product.order(quantity: :desc).page(params[:page]).per(15)
                end
  end

  def search
    @products = Product.search(params[:keyword]).order(quantity: :desc).page(params[:page]).per(15)
    render :index
  end

  def table
    @products = Product.order(valueSell: :desc).page(params[:page]).per(8)
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @product.quantity.zero?
      @product.destroy
      flash[:notice] = 'product was successfully destroyed.'
    else
      flash[:alert] = 'Cannot delete product with quantity greater than zero.'
    end
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def comprar
    if current_user
      @product = Product.find(params[:id])
      purchase = current_user.purchases.last || current_user.purchases.create
      purchase.item_purchases.create(product: @product, quantity: 1)
      redirect_to purchase_path(purchase), notice: 'Produto adicionado ao carrinho com sucesso!'
    else
      redirect_to new_user_session_path, alert: 'Por favor, faça login para continuar.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find_by(id: params[:id])
    return if @product

    flash[:alert] = 'Product not found.'
    redirect_to products_url
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :weight, :width, :length, :valueSell, :valueBuy, :depth, :quantity,
                                    :description, :category_id, :photo1, :photo2, :photo3)
  end
end
