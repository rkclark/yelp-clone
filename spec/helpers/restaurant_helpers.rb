module RestaurantHelpers

  def create_restaurant(name:, description: 'description', id: 1)
    test_user = User.create(email: "test@test.com", password: 'testtest', password_confirmation: 'testtest')
    test_user.restaurants.create(name: name, description: description, id: id, user_id: 1)
  end

  def fill_in_restaurant_form(name:, description:, image: nil)
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    attach_file('restaurant[image]', Rails.root.join(image)) if image
    click_button 'Create Restaurant'
  end

  def update_restaurant(name:, description:)
    visit '/restaurants'
    click_link 'Edit KFC'
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    click_button 'Update Restaurant'
  end

end
