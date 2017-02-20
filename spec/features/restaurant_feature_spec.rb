require 'rails_helper'

feature 'restaurant' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page). to have_content 'No restaurants yet'
      expect(page).to have_link'Add a restaurant'
    end
  end

  context ' restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end

    scenario 'display restaurants' do
      visit '/restaurants' do
        expect(page).to have_contetnt('KFC')
        expect(page).not_to have_content('No restaurants yet')
      end
    end
  end
end
