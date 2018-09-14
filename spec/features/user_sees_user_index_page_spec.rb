require 'rails_helper'

describe "User index" do
  before(:each) do
    user = create(:user)
    visit new_user_session_path

    fill_in :user_email,	with: user.email
    fill_in :user_password,	with: user.password

    within ".actions" do
      click_on "Log in"
    end
  end

  context "shows data:" do
    it "current_temperature" do

      visit user_root_path

      expect(page).to have_content(user.email)
      expect(page).to have_content("Today's Weather")
      expect(page).to have_css(".forecast")
    end
  end
end
