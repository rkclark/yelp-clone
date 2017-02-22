module ReviewHelpers

  def fill_in_review_form(restaurant:)
    visit '/restaurants'
    click_link "Review #{restaurant}"
    fill_in :Thoughts, with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
  end

end
