require 'rails_helper'

describe 'resources index page', :vcr do
    it 'makes a api call for food waste articles', :vcr do
        visit '/'

        expect(page).to have_link('Resources')

        click_on 'Resources'

        expect(current_path).to eq('/resources')

        expect(page).to have_content('Relevant Articles on Food Waste')

        within '#our_favorite_orgs' do
            expect(page).to have_button('Donate to Feeding America')
            expect(page).to have_button('Donate to Feeding America')
        end

        within '#our_favorite_news' do
            expect(page).to have_link('Food Bank News')
        end

        within '#article-nyt://article/fe540316-23d2-51d4-aafb-f87946cba495' do
            expect(page).to have_content("The city’s aid organizations are facing labor shortages and supply chain disruptions in their effort to help the 1.5 million New Yorkers who cannot afford food.")
            expect(page).to have_link('https://www.nytimes.com/2021/12/13/business/economy/new-york-food-banks-pandemic.html')

        end
    end 
end