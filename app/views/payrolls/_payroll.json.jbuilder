# frozen_string_literal: true

json.extract! payroll, :id, :date_of_payroll, :commission, :discount, :salary, :description, :employee_id, :created_at,
              :updated_at
json.url payroll_url(payroll, format: :json)
