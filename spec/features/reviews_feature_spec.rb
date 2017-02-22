require 'rails_helper'

feature 'reviewing' do
  let(:restaurant_name) { 'KFC' }
  before { create_restaurant(name: restaurant_name) }

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in :Thoughts, with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'so so'
  end
end
