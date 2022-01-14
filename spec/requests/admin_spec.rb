require 'rails_helper'

RSpec.describe 'User', type: :request do
  before(:all) do 
    Account.create(firstname: "sa", lastname: "sd", role: "admin", contact_number: "09as", address: "dsd", user_attributes: { email: "sa@gmail.co", password: "password"})
    admin = Account.find_by(role: "admin")
    sign_in User.new(email: "sa@gmail.co", password: "password", account_id: admin.id)
  end

  it 'signs user in' do
    get root_path
    expect(response).to have_http_status(:ok)
  end

  it 'signs out user' do 
    sign_out User.new(email: "sa@gmail.co", password: "password")
    get root_path
    expect(response).to have_http_status(:found)
  end
end