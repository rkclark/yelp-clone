describe Restaurant do

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
  end

  it 'is not valid with a name less than three chars' do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    test_user = User.create(email: "test@test.com", password: 'testtest', password_confirmation: 'testtest')
    test_user.restaurants.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end

end
