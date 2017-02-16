require 'rails_helper'

RSpec.feature "User can create movies" do
  context "Authorized user" do
    xscenario "can create a movie" do
      #prepare data

      visit movies_path
      click_on "Add a Movie"

      fill_in "Title", with: "Titanic"
      fill_in "Director", with: "James Cameron"
      fill_in "Year", with: "1996"
      click_on "Create Movie"

      expect(current_path).to eq(movies_path)

      within(".movies_list h3") do
        expect(page).to have_content("Titanic")
      end

      within(".movies_list p") do
        expect(page).to have_content("Directed by: James Cameron")
        expect(page).to have_content("Released: 1996")
      end
    end

    xscenario "user sees all movies" do
      # create data - movies

      visit movies_path

      within(".movies_list div:first") do
        expect(page).to have_content("The Lego Batman Movie")
      end

      within(".movies_list div:nth-child(2)") do
        expect(page).to have_content("Lord of the Rings")
        expect(page).to have_content("Directed by: Peter Jackson")
        expect(page).to have_content("Released: 2005")
      end
    end
  end
end
