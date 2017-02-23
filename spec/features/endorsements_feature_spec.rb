require 'rails_helper'

feature 'endorsing reviews' do
  before do
    test_user = User.create(email: "test@test.com", password: 'testtest', password_confirmation: 'testtest')
    restaurant = test_user.restaurants.create(name: "KFC")
    restaurant.reviews.create_with_user({rating: 1, thoughts: 'It was an abomination'}, test_user)
  end

  scenario 'a user can endorse a review, which updates the review endorsement count', js: true do
    visit '/restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end

  context 'Multiple endorsements', js: true do
    scenario 'Can see correct number of endorsements listed' do
      visit '/restaurants'
      click_link 'Endorse Review'
      expect(page).to have_css('.endorsements_count', text: '1')
      click_link 'Endorse Review'
      expect(page).to have_content('2 endorsements')
    end
  end

end
