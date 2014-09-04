
describe Review do

	before (:each) do
		create_user
		create_coffeespot
	end

	it 'can be created' do
		thoughts, rating, coffeespot_id, user_id ='Test CoffeeSpot thoughts', 5, Coffeespot.first.id, User.first.id
		expect(Review.new(thoughts: thoughts, rating: rating, coffeespot_id: coffeespot_id, user_id: user_id).valid?).to be true
	end

	it 'can be saved in the database' do
		expect(Review.count).to eq 0
		create_review
		expect(Review.count).to eq 1
	end

	it 'can be retrieved from he database' do
		create_review
		expect(Review.first.thoughts).to eq 'Test CoffeeSpot thoughts'
	end

	it 'can be removed from the database' do
		create_review
		Review.first.destroy
		expect(Review.count).to eq 0
	end	

	it 'cannot be saved in the database without a thoughts (review content)' do
		create_review('', 5, Coffeespot.first.id, User.first.id)
		expect(Review.count).to eq 0
	end	

	it "cannot be saved in the database without a coffeespot id" do
		create_review('Test CoffeeSpot thoughts', 5, '', User.first.id)
		expect(Review.count).to eq 0
	end	

	it "cannot be saved in the database without a user's id" do
		create_review('Test CoffeeSpot thoughts', 5, Coffeespot.first.id, '')
		expect(Review.count).to eq 0
	end	
	
	it 'can have a rating' do
		review = create_review
		expect(review.rating).to eq 5
	end	

	it 'knows which coffeespot it belongs to' do
		review = create_review
		expect(review.coffeespot_id).to eq Coffeespot.first.id
	end

	it 'knows which user it belongs to' do
		review = create_review
		expect(review.user_id).to eq User.first.id
	end

end


def create_user (email = "user@example.com", password = "password", password_confirmation = "password")
	User.create(email: email, password: password, password_confirmation: password_confirmation)
end

def create_coffeespot (name='Test CoffeeSpot', url='www.test_url.com', user_id=User.first.id)
	Coffeespot.create(name: name, url: url, user_id: user_id)
end

def create_review (thoughts='Test CoffeeSpot thoughts', rating = 5, coffeespot_id = Coffeespot.first.id, user_id = User.first.id)
	Review.create(thoughts: thoughts, rating: rating, coffeespot_id: coffeespot_id, user_id: user_id)
end
