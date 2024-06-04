require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
  
    it 'responds with a 302 redirect' do
      user = create(:user)
      
      get :show, params: { id: user.id }
      
      expect(response).to have_http_status(302)
    end

    it "responds successfully" do
      user = create(:user)
      sign_in user
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
     end

  end
end
