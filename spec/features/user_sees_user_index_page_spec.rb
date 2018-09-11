require 'rails_helper'

describe "User index" do
  context "shows data" do
    it "current_temperature" do
      user = create(:user)

      visit user_root_path

      expect(page).to have_content(user.email)
      expect(page).to have_content("Today's Weather")
      expect(page).to have_css(.forecast)
    end
  end
end
