# frozen_string_literal: true

class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[show edit update destroy]
  rescue_from ArgumentError, with: :handle_argument_error

  # GET /departments or /departments.json
  def index
    @departments = Department.order(quantity: :desc).page(params[:page]).per(8)
  end

  # GET /departments/1 or /departments/1.json
  def show
    @department = Department.find(params[:id])
    @products = Product.joins(:category).where(categories: { department_id: @department.id }).page(params[:page]).per(15)
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit; end

  # POST /departments or /departments.json
  # departments_controller.rb

  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { redirect_to departments_path, alert: 'Invalid name. Please try again.' }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def table
    @departments = Department.order(quantity: :desc).page(params[:page]).per(8)
  end

  # PATCH/PUT /departments/1 or /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to department_url(@department), notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1 or /departments/1.json
  def destroy
    if @department.quantity.zero?
      @department.destroy
      flash[:notice] = 'Department was successfully destroyed.'
    else
      flash[:alert] = 'Cannot delete department with quantity greater than zero.'
    end
    respond_to do |format|
      format.html { redirect_to departments_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_department
    @department = Department.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def department_params
    params.require(:department).permit(:name, :quantity)
  end

  def handle_argument_error(exception)
    Rails.logger.error("ArgumentError during department creation: #{exception.message}")
    redirect_to departments_path, alert: 'Invalid name. Please try again.'
  end
end
