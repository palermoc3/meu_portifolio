# frozen_string_literal: true

json.extract! administrator, :id, :cnpj, :user_id, :created_at, :updated_at
json.url administrator_url(administrator, format: :json)
