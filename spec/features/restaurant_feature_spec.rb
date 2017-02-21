require 'rails_helper'

feature 'restaurant' do
  let(:restaurant_name) { 'KFC' }
  let(:restaurant_new_name) { 'Kentucky Fried Chicken' }
  let(:restaurant_desc) { 'Deep fried goodness' }
  let(:restaurant_new_desc) { "Hope you don't get stabbed" }


  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page). to have_content 'No restaurants yet'
      expect(page).to have_link'Add a restaurant'
    end
  end

  context ' restaurants have been added' do
    before { create_restaurant(name: restaurant_name) }

    scenario 'display restaurants' do
      visit '/restaurants' do
        expect(page).to have_content(restaurant_name)
        expect(page).not_to have_content('No restaurants yet')
      end
    end
  end
  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      fill_in_restaurant_form(name: restaurant_name, description: restaurant_desc)
      expect(page).to have_content restaurant_name
      expect(current_path).to eq '/restaurants'
    end

    context 'an invalid restaurant' do
      let(:short_name) { 'kf' }

      scenario 'does not let you submit a name that is too short' do
        fill_in_restaurant_form(name: short_name, description: restaurant_desc)
        expect(page).not_to have_css 'h2', text: 'kf'
        expect(page).to have_content 'error'
      end
    end
  end
  context 'viewing restaurants' do
    let!(:kfc) { create_restaurant(name: restaurant_name) }

    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content restaurant_name
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end
  context 'editing restaurants' do
    before { create_restaurant(name: restaurant_name, description: restaurant_desc, id: 1) }

    scenario 'let a user edit a restaurant' do
      update_restaurant(name: restaurant_new_name, description: restaurant_new_desc)
      click_link 'Kentucky Fried Chicken'
      expect(page).to have_content restaurant_new_name
      expect(page).to have_content restaurant_new_desc
      expect(current_path).to eq '/restaurants/1'
    end
  end
  context 'deleting restaurants' do
    before { create_restaurant(name: restaurant_name, description: restaurant_desc) }

    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content restaurant_name
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end
end
