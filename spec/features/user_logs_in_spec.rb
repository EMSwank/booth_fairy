require 'rails_helper'

email = Faker::Internet.email
password = Faker::Internet.password

describe "User logs in" do
  context "by creating new account" do
    it "and clicking login to get to the login screen" do
      visit root_path

      expect(page).to have_content("Boothfairy")

      within("#login-button") do
        click_on "Log in"
      end

      expect(current_path).to eq(new_user_session_path)
    end

    it 'and creates a new account by clicking on Create Account' do
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

    it 'also sees a link to login with google' do
      visit new_user_session_path

      expect(page).to have_content("Sign in with Google")
      expect(page).to have_link("Sign in with Google")
    end
  end
end
