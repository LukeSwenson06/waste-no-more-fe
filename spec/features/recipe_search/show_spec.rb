require 'rails_helper'

describe 'Recipe Search Page', :vcr do
  it 'can search for recipes by name', :vcr do
      visit '/recipe_search'

      fill_in "name", with: "cookies"
      within('div#by_name') do
        click_button("Search")
      end

      expect(current_path).to eq('/recipe_search/index')
      expect(page).to have_content("Oreo")
  end
  it 'can search for recipes by an ingredient', :vcr do
      visit '/recipe_search'

      fill_in "ingredient1", with: "chicken"
      within('div#by_ingredient') do
        click_button("Search")
      end

      expect(current_path).to eq('/recipe_search/index')
      expect(page).to have_content("Crispy Buttermilk")
  end
  it 'can search for recipes by multiple ingredient', :vcr do
      visit '/recipe_search'

      fill_in "ingredient1", with: "bacon"
      fill_in "ingredient2", with: "eggs"
      within('div#by_ingredient') do
        click_button("Search")
      end

      expect(current_path).to eq('/recipe_search/index')
      expect(page).to have_content("Egg")
      expect(page).to have_content("Bacon")
  end
end
