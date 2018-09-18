require 'rails_helper'

describe "User index" do
  
  context "shows data:" do
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
  end
end
