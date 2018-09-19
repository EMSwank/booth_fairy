require 'rails_helper'

describe "User index" do

  context "shows data" do
    before(:each) do
      @user = create(:user, email: "test@test.com")
      visit new_user_session_path

      fill_in :user_email,	with: @user.email
      fill_in :user_password,	with: @user.password

      VCR.use_cassette("features/user_sees_an_index_page") do
        within ".actions" do
          click_on "Log in"
        end
      end
    end

    it "current_temperature" do
      VCR.use_cassette("features/user_sees_user_index_page") do
      visit user_root_path
        expect(page).to have_content(@user.email)
        expect(page).to have_content("Current Weather")
        expect(page).to have_css(".forecast")
      end
    end

    it 'sees a list of the users markets' do
      other_user = create(:user, email: Faker::Internet.email("Test"))
      market_1 = create(:market, user_id: @user.id)
      market_2 = create(:market, user_id: @user.id)
      market_3 = create(:market, name: "test1", user_id: other_user.id)

      VCR.use_cassette("features/user_sees_user_index_page") do
        visit user_root_path
        expect(page).to have_css("#markets")
        expect(page).to have_content(market_1.name)
        expect(page).to have_content(market_2.name)
        expect(page).to_not have_content(market_3.name)
      end
    end

    it 'sees a link to create a new market' do
      VCR.use_cassette("features/user_sees_user_index_page") do
        visit user_root_path

        click_on "Add Market"

        expect(current_path).to eq(new_market_path)
      end
    end
  end
end
