module ReviewHelpers

  def fill_in_review_form(restaurant:, rating: 3)
    visit '/restaurants'
    click_link "Review #{restaurant}"
    fill_in :Thoughts, with: "so so"
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

end
