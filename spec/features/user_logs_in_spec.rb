require 'rails_helper'

describe "User logs in" do
  context "by creating new account" do
    it "and clicking login to get to the login screen" do
      visit root_path

      expect(page).to have_content("Boothfairy")

      click_on "Log in"

      expect(current_path).to eq(login_path)
    end

    it 'creates a new account by clicking on Create Account' do
      email = Faker::Internet.email
      password = Faker::Internet.password

      visit login_path

      click_on "Create New Account"

      fill_in "Email address",	with: email
      fill_in "Password", with: password

      expect(current_path).to eq(user_dashboard_path)
      expect(page).to have_content("Check your email to complete registration.")
    end
  end
end
