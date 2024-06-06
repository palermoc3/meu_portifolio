# frozen_string_literal: true

json.extract! about, :id, :about_text, :store_id, :created_at, :updated_at
json.url about_url(about, format: :json)
