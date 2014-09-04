

describe Coffeespot do

	before (:each) { create_user }

	it 'can be created' do
		name, url, user_id = 'Test CoffeeSpot', url = 'www.test_url.com', User.first.id
		expect(Coffeespot.new(name: name, url: url, user_id: user_id).valid?).to be true
	end

	it 'can be saved in the database' do
		expect(Coffeespot.count).to eq 0
		create_coffeespot
		expect(Coffeespot.count).to eq 1
	end

	it 'can be retrieved from he database' do
		create_coffeespot
		expect(Coffeespot.first.name).to eq 'Test CoffeeSpot'
	end

	it 'can be removed from the database' do
		create_coffeespot
		Coffeespot.first.destroy
		expect(Coffeespot.count).to eq 0
	end	

	it 'cannot be saved in the database without a name' do
		create_coffeespot('', 'www.test_url.com', User.first.id)
		expect(Coffeespot.count).to eq 0
	end	

	it "cannot be saved in the database without a user's id" do
		create_coffeespot('Test CoffeeSpot', 'www.test_url.com', '')
		expect(Coffeespot.count).to eq 0
	end	

	it 'name must be unique' do
		2.times { create_coffeespot('Test CoffeeSpot', 'www.test_url.com', User.first.id) }
		expect(Coffeespot.count).to eq 1
	end	

	it 'name is case insensitive' do
		create_coffeespot('Test CoffeeSpot', 'www.test_url.com', User.first.id)
		create_coffeespot('test coffeespot', 'www.test_url.com', User.first.id)
		expect(Coffeespot.count).to eq 1
	end

	it 'is created without reviews by default' do
		coffeespot = create_coffeespot
		expect(coffeespot.reviews.count).to eq 0
	end	

	it 'can have a review' do
		coffeespot = create_coffeespot
		coffeespot.reviews << create_review
		expect(coffeespot.reviews.count).to eq 1
	end	

	it 'can have more than one review' do
		coffeespot = create_coffeespot
		coffeespot.reviews << create_review('review one') << create_review('review two')
		expect(coffeespot.reviews.count).to eq 2
	end	

	it "knows what are it's reviews" do
		coffeespot = create_coffeespot
		coffeespot.reviews << create_review
		expect(coffeespot.reviews.first.thoughts).to eq 'Test CoffeeSpot thoughts'
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
