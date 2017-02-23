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

  describe "#average_rating" do
    context "no reviews" do
      it 'returns "N/A" when there are no reviews' do
        restaurant = Restaurant.create(name: 'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end
    context '1 review' do
      it 'returns that rating' do
        test_user = User.create(email: "test@test.com", password: 'testtest', password_confirmation: 'testtest')
        restaurant = test_user.restaurants.create(name: "Moe's Tavern")
        restaurant.reviews.create_with_user({rating: 4}, test_user)
        expect(restaurant.average_rating).to eq 4
      end
    end
    context '2 reviews' do
      it 'returns average rating' do
        test_user = User.create(email: "test@test.com", password: 'testtest', password_confirmation: 'testtest')
        test_user2 = User.create(email: "test2@test.com", password: 'testtest', password_confirmation: 'testtest')
        restaurant = test_user.restaurants.create(name: "Moe's Tavern")
        restaurant.reviews.create_with_user({rating: 1}, test_user)
        restaurant.reviews.create_with_user({rating: 5}, test_user2)
        expect(restaurant.average_rating).to eq 3
      end
    end
  end

end
