# frozen_string_literal: true

json.extract! purchase, :id, :user_id, :price, :paid, :packageSize, :receive, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
