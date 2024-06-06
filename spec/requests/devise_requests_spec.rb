# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Devise Requests', type: :request do
  let(:user) { create(:user) }

  before do
    @department = create(:department, name: 'Toys')
    @category = create(:category, name: 'Brinquedos', department: @department)
    @administrator = create(:administrator)
    @store = create(:store, administrator: @administrator)
  end

  describe 'User Sign In' do
    it 'signs user in' do
      expect(user_session_path).not_to be_nil

      # Sign in
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      expect(response).to have_http_status(:see_other) # Status 303
      follow_redirect!
      expect(response).to render_template(:index)
      expect(controller.current_user).to eq(user)
    end
  end

  describe 'User Sign Out' do
    it 'signs user out' do
      # Sign in first
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      follow_redirect!
      expect(controller.current_user).to eq(user)

      # Sign out
      get destroy_user_session_path
      expect(response).to have_http_status(:see_other)
      follow_redirect!
      puts "Redirected to: #{response.request.fullpath}"
      expect(response).to render_template(:index) # Ajuste conforme o comportamento esperado após o logout
      expect(controller.current_user).to be_nil
    end
  end
end
