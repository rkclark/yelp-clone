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
    expect('restaurant_1').not_to have_css('a h2', :text => "Review #{restaurant_name}")
  end

  scenario 'cannot place a review unless signed in' do
    visit('/')
    expect('restaurant_1').not_to have_css('a h2', :text => "Review #{restaurant_name}")
  end

  scenario 'displays an average rating for all reviews' do
    sign_up
    fill_in_review_form(restaurant: restaurant_name, rating: 3)
    sign_out
    sign_up(email: 'test2@test.com')
    fill_in_review_form(restaurant: restaurant_name, rating: 5)
    expect(page).to have_content('Average rating: ★★★★☆')
  end
end
