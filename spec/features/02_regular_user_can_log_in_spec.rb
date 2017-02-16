require 'rails_helper'

RSpec.feature "User user can log in spec" do
  scenario "with valid credentials" do
    user = User.create(username: "RegUser", email: "reguser@example.com", password: "password")

    visit login_path

    expect(page).to have_content("Log In or Get Out")

    fill_in "session[email]", with: "reguser@example.com"
    fill_in "session[password]", with: "password"
    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    within("h1.greeting") do
      expect(page).to have_content("Welcome RegUser!")
    end

    within("div.user_info p") do
      expect(page).to have_content("Email: reguser@example.com")
    end
  end

  xscenario "with invalid credentials" do
    user = User.create(username: "RegUser", email: "reguser@example.com", password: "password")

    visit login_path

    expect(page).to have_content("Log In or Get Out")

    fill_in "session[email]", with: "reguser@example.com"
    fill_in "session[password]", with: "notthepassword"
    click_on "Log In"

    expect(current_path).to eq(login_path)

    within(".flash_danger") do
      expect(page).to have_content("Invalid Credentials!")
    end
  end
end
