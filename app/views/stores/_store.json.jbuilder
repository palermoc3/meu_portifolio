# frozen_string_literal: true

json.extract! store, :id, :kind, :theme, :payroll_day, :administrator_id, :created_at, :updated_at
json.url store_url(store, format: :json)
