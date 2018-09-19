require 'rails_helper'

describe "A User" do
  context "visits market index page" do
      before(:each) do
      @user = create(:user)
      @market = create(:market, user_id: @user.id)
      visit new_user_session_path

      fill_in :user_email,	with: @user.email
      fill_in :user_password,	with: @user.password

      VCR.use_cassette("features/user_creates_a_market") do
        within ".actions" do
          click_on "Log in"
        end
      end
    end

    it "and sees all the market dates theyve participated in" do
      visit markets_path

      click_on "Create New Sales Day"
      
      expect(current_path).to eq(new_market_sales_day_path(@market))
      select(@market.name, from: 'Market')
      fill_in "Market Date",	with: Date.today
      
      click_on "Save Sales day"

      expect(current_path).to eq(market_path(markets_path))

      click_on @market.name

      expect(current_path).to eq(market_path(@market))
    end
  end
end

# A user visits the market index page
# They see a list of all the market dates they've participated in
# They see the total sales of each market that day
# They can click on the market to visit that market's show page