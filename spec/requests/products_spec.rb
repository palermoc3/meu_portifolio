require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    it 'retorna uma lista de produtos ordenada por quantidade decrescente' do
      toys = Department.create!(name: 'Toys')
      fem = Category.create!(name: 'brinquedo fem', department_id: toys.id)
      product1 = Product.create!(
        name: Faker::Commerce.product_name,
        weight: 0.5,
        width: 1.2,
        length: 0.6,
        depth: 0.2,
        quantity: 20,
        valueSell: 23.99,
        valueBuy: 12.87,
        description: Faker::Lorem.sentence(word_count: 3),
        category_id: fem.id,
      )

      product2 = Product.create!(
        name: Faker::Commerce.product_name,
        weight: 0.5,
        width: 1.2,
        length: 0.6,
        depth: 0.2,
        quantity: 22,
        valueSell: 20.99,
        valueBuy: 15.99,
        description: Faker::Lorem.sentence(word_count: 3),
        category_id: fem.id,
      )

      get :index

      expect(assigns(:products)).to eq([product2, product1]) 
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end
end
