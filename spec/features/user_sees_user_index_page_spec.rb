require 'rails_helper'

describe "User index" do

  context "shows data" do
    before(:each) do
      @user = create(:user)
      visit new_user_session_path

      fill_in :user_email,	with: @user.email
      fill_in :user_password,	with: @user.password

      within ".actions" do
        click_on "Log in"
      end
    end

    it "current_temperature" do

      visit user_root_path

      expect(page).to have_content(@user.email)
      expect(page).to have_content("Current Weather")
      expect(page).to have_css(".forecast")
    end

    it 'sees a list of the users markets' do
      market_1 = create(:market, user_id: @user.id)
      market_2 = create(:market, user_id: @user.id)
      market_3 = create(:market)

      visit user_root_path

      expect(page).to have_css("#markets")
      expect(page).to have_content(market_1.name)
      expect(page).to have_content(market_2.name)
      expect(page).to_not have_content(market_3.name)
    end
  end
end
