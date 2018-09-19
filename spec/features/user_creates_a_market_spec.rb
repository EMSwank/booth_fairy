require 'rails_helper'

describe "User creates a market" do
  context "by visiting the market new page" do
    before(:each) do
      @user = create(:user)
      visit new_user_session_path

      fill_in :user_email,	with: @user.email
      fill_in :user_password,	with: @user.password

      VCR.use_cassette("features/user_creates_a_market") do
        within ".actions" do
          click_on "Log in"
        end
      end
    end

    it "and filling out a form" do
      visit new_user_market_path

      fill_in :name,	with: "Name-1"
      fill_in :street_address, with: "address 1"

      click_on 'Create New Market'

      expect(current_path).to eq(user_markets_path)
      expect(page).to have_content("Name-1")
    end
  end
end





# User visits the Market New page
# They see a form with the market name (drop-down?)
# as well as a field for address and a submit button.
# After they fill out the form and click "Create New Market"
# They're redirected to the market index page.
