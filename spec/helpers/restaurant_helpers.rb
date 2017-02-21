module RestaurantHelpers

  def create_restaurant(name:, description: 'description', id: 1)
    Restaurant.create(name: name, description: description, id: id)
  end

  def fill_in_restaurant_form(name:, description:)
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: name
    fill_in 'Description', with: description
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
