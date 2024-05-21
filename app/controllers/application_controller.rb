class ApplicationController < ActionController::Base
    before_action :set_current_store
    before_action :load_departments
    before_action :set_top_departments
  
    private
  
    def set_current_store
      @current_store = Store.first # Supondo que você tenha lógica para recuperar a loja atual aqui
    end
  
    def load_departments
      @departmentsAll = Department.includes(:categories).all
    end
  
    def set_top_departments
      @top_departments = Department.order(quantity: :desc).limit(4)
    end
  
    def top1_departments
      @top1_departments ||= @top_departments.first
    end
  
    def top2_departments
      @top2_departments ||= @top_departments.second
    end
  
    def top3_departments
      @top3_departments ||= @top_departments.third
    end
  
    def top4_departments
      @top4_departments ||= @top_departments.fourth
    end
  end
  