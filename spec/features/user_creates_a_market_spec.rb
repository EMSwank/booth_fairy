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
      visit new_market_path

      fill_in :market_name,	with: "Name-1"
      fill_in :market_street_address, with: "address 1"

      click_on 'Create Market'

      expect(current_path).to eq(markets_path)
      expect(page).to have_content("Name-1")
    end
  end
end
