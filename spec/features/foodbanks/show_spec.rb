require 'rails_helper'

describe 'Food Bank Show API call', :vcr do
    it 'can create show pages for the foodbanks', :vcr do
        visit '/foodbanks/742244826'

        expect(current_path).to eq('/foodbanks/742244826')
        
        within '#information' do
            expect(page).to have_content("http://www.weldfoodbank.org/")
            expect(page).to have_content('Weld Food Bank')
            expect(page).to have_content("Weld Food Bank's (WFB) mission is to lead and engage our community in the fight against hunger.")
            expect(page).to have_content("Turning the tables on hunger.")
            expect(page).to have_content("Score: 98.04")
            expect(page).to have_content("Address: Greeley, CO, 1108 H Street, 80631")
        end
    end 
end