require 'rails_helper'

describe "User logs in" do
  context "by creating new account" do
    it "and clicking login to get to the login screen" do
      visit root_path

      expect(page).to have_content("Boothfairy")

      click_on "Log in"

      expect(current_path).to eq(new_user_session_path)
    end

    it 'and creates a new account by clicking on Create Account' do
      email = Faker::Internet.email
      password = Faker::Internet.password

      visit new_user_session_path

      click_on "Sign up"
      expect(current_path).to eq(new_user_registration_path)

      fill_in "Email",	with: email
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password

      click_on "Sign up"

      expect(current_path).to eq(user_root_path)
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end
end
