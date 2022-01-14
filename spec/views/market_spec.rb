require 'rails_helper'

RSpec.describe 'Markets', type: :feature do
    # capybara
    describe 'Login as Admin' do
        before(:each) do 
            account = Account.create(firstname: "a", lastname: "sasa", role: "admin", user_attributes: {email: "saj@gmail.com", password: "password"})
            login_as User.new(email: "saj@gmail.com", password: "password", account_id: account.id)
        end

        context "Market List" do
            before {visit markets_path}

            it 'shows all markets in the body' do
                within 'body' do
                    expect(page).to have_content("Stock Market")
                    expect(page).to have_content("Add Market")
                end
            end

        end

        context "New Market" do
            before {visit new_market_path}
            it 'creates' do
                fill_in('Name', with: 'Jobillie')
                fill_in('Symbol', with: 'ANT')
                fill_in('Supply', with: '1000')
                fill_in('Market Cap', with: '10000')
                click_button('Save Market')
                expect(page).to have_content("Jobillie")
            end
        end

        context "Logs out" do
            before {visit destroy_user_session_path}
            it 'creates' do
                expect(page).to have_content("Your Secure Stock Market App")
            end
        end
        

        
    end

    describe 'Login as Trader' do
        before(:each) do 
            account = Account.create(firstname: "ana", lastname: "sasa", role: "trader", user_attributes: {email: "sasya@gmail.com", password: "password"})
            login_as User.new(email: "sasya@gmail.com", password: "password", account_id: account.id)
        end

        context "Market List" do
            before {visit markets_path}

            it 'shows all markets in the body' do
                within 'body' do
                    expect(page).to have_content("Stock Market")
                    expect(page).not_to have_content("Add Market")
                end
            end
        end

        context "Market" do
            before {visit new_market_path}
            it 'creates' do
                expect(page).to have_content("Access Denied")
            end
        end
    end
end