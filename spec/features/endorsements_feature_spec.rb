require 'rails_helper'

feature 'endorsing reviews' do
  before do
    test_user = User.create(email: "test@test.com", password: 'testtest', password_confirmation: 'testtest')
    restaurant = test_user.restaurants.create(name: "KFC")
    restaurant.reviews.create_with_user({rating: 1, thoughts: 'It was an abomination'}, test_user)
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    visit '/restaurants'
    click_button 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end

  context 'Multiple endorsements' do
    scenario 'Can see correct number of endorsements listed' do
      visit '/restaurants'
      click_button 'Endorse Review'
      click_button 'Endorse Review'
      click_button 'Endorse Review'
      expect(page).to have_content('3 endorsements')
    end
  end

end
