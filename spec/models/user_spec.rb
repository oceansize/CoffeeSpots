
describe User do

	it 'can be created' do
		email, password = 'user@test.com', 'password'
		expect(User.new(email: email, password: password, password_confirmation: password).valid?).to be true
	end

	it 'can be saved in the database' do
		expect(User.count).to eq 0
		create_user
		expect(User.count).to eq 1
	end

	it 'can be retrieved from he database' do
		create_user
		expect(User.first.email).to eq 'user@example.com'
	end

	it 'can be removed from the database' do
		create_user
		User.first.destroy
		expect(User.count).to eq 0
	end

	it 'do not have their passowrd saved in the database' do
		create_user
		expect(User.first.password).to eq nil
	end

	it 'have their passowrd saved as a password diagest the database' do
		create_user
		expect(User.first.encrypted_password.chars.count).to eq 60
	end

	it 'cannot be saved in the database without an email' do
		create_user('', 'password', 'password')
		expect(User.count).to eq 0
	end

	it 'cannot be saved in the database without a password' do
		create_user('user@example.com', '', 'password')
		expect(User.count).to eq 0
	end

	it 'cannot be saved in the database without password confirmation' do
		create_user('user@example.com', 'password', '')
		expect(User.count).to eq 0
	end

	it 'their password and password confirmation must match' do
		create_user('user@example.com', 'password', 'wrong-password')
		expect(User.count).to eq 0
	end

	it 'their password cannot be shorter than 8 characters' do
		create_user('user@example.com', '7-chars', '7-chars')
		expect(User.count).to eq 0
	end

	it 'their email must be unique' do
		2.times { create_user }
		expect(User.count).to eq 1
	end

	it 'their email is case insensitive' do
		create_user('user@example.com', 'password', 'password')
		create_user('User@example.com', 'password', 'password')
		expect(User.count).to eq 1
	end

	it 'know what their is email' do
		create_user
		expect(User.first.email).to eq 'user@example.com'
	end	


	it 'can have a coffeespot' do
		user = create_user
		user.coffeespots << create_coffeespot
		expect(user.coffeespots.count).to eq 1
	end

	it 'can have more than one coffeespot' do
		user = create_user
		user.coffeespots << create_coffeespot('coffeespot_one') << create_coffeespot('coffeespot_two')
		expect(user.coffeespots.count).to eq 2
	end

	it 'know what are their coffeespots are' do
		user = create_user
		user.coffeespots << create_coffeespot
		expect(user.coffeespots.first.name).to eq 'Test CoffeeSpot'
	end

end


def create_user (email = "user@example.com", password = "password", password_confirmation = "password")
	User.create(email: email, password: password, password_confirmation: password_confirmation)
end

def create_coffeespot (name='Test CoffeeSpot', url='www.test_url.com', user_id=User.first.id)
	Coffeespot.create(name: name, url: url, user_id: user_id)
end
