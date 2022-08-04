require 'rails_helper'

describe 'Food Bank Index API call', :vcr do
    it 'can list food banks according to their charity navigator financial score', :vcr do
        visit '/foodbanks'
        
        within '#states' do
            select 'CO'
        end
        
        click_on "Search States"

        expect(current_path).to eq('/foodbanks/index')

        within '#foodbank-742244826' do 
            expect(page).to have_content('Weld Food Bank')
            expect(page).to have_content('Score: 98.04')
            expect(page).to have_link('Find out more about this foodbank')
        end

        within '#foodbank-742227731' do 
            expect(page).to have_content('Community Food Share')
            expect(page).to have_content('Score: 97.17')
            expect(page).to have_link('Find out more about this foodbank')
        end
    end
end