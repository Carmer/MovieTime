require 'rails_helper'

RSpec.feature "Visitor tries to create account" do
  context "providing valid credentials" do
    scenario  "account creation is successful" do
      visit sign_up_path

      fill_in "Username", with: "NewUser"
      fill_in "Email", with: "NewUser@example.com"
      fill_in "Password", with: "password"

      fill_in "user[password_confirmation]", with: "password"
      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last))

      within("h1.greeting") do
        expect(page).to have_content("Welcome NewUser!")
      end
    end
  end
end
