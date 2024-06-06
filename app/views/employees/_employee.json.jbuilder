# frozen_string_literal: true

json.extract! employee, :id, :ctps, :salary_base, :hours, :commission_percent, :user_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
