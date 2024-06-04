# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a new user' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'não é válido com um email inválido' do
    user = build(:user, email: 'email@')
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include('formato de e-mail inválido')
  end

end
