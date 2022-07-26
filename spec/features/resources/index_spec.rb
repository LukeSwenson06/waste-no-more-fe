require 'rails_helper'

describe 'resources index page', :vcr do
    it 'makes a api call for food waste articles', :vcr do
        visit '/'

        expect(page).to have_link('Resources')

        click_link 'Resources'

        expect(current_path).to eq('/resources')

        expect(page).to have_content('Relevant Articles on Food Insecurity')

        within '#our_favorite_orgs' do
            expect(page).to have_button('Donate to Feeding America')
        end

        within '#our_favorite_news' do
            expect(page).to have_link('Food Bank News')
        end

        expect(page).to have_content(" aid organizations are facing labor shortages and supply chain disruptions in their effort to help the 1.5 million New Yorkers who cannot afford food.")
        expect(page).to have_link('2021-12-13 The city’s aid organizations are facing labor shortages and supply chain disruptions in their effort to help the 1.5 million New Yorkers who cannot afford food.')
    end 
end