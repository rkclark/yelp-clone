require 'rails_helper'

feature 'reviewing' do
  let(:restaurant_name) { 'KFC' }
  before { create_restaurant(name: restaurant_name) }

  scenario 'allows users to leave a review using a form' do
    sign_up
    fill_in_review_form(restaurant: restaurant_name)
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'so so'
  end

  scenario 'cannot review the same restaurant twice' do
    sign_up
    fill_in_review_form(restaurant: restaurant_name)
    click_link "Review #{restaurant_name}"
    expect(page).to have_content 'You have already reviewed this restaurant!'
  end
end
