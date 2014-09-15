require 'rails_helper'

describe 'Adding reviews to coffeespots' do

	before (:each) do
		create_user
		create_coffeespot
		visit root_path
	end

	it 'Coffeespots initially have no reviews' do
		expect(page).to have_content 'Test CoffeeSpot'
		expect(page).to have_content 'No reviews yet'
	end

	it 'users cannot add reviews unless signed in' do
		expect(page).not_to have_content 'Add Review for Test CoffeeSpot'
	end

	it 'users can add reviews to coffeespots if signed in' do
		sign_in_user
		click_link 'Add a Review'
		select '5', from: 'Rating'
		fill_in 'Thoughts', with: 'Great coffee'
		click_button 'Submit Review'
		expect(page).to have_content 'Great coffee'
	end
end


def create_user (email = "user@example.com", password = "password", password_confirmation = "password")
    User.create(email: email, password: password, password_confirmation: password_confirmation)
end

def create_coffeespot (name='Test CoffeeSpot', url='www.test_url.com', user_id=User.first.id)
    Coffeespot.create(name: name, url: url, user_id: user_id)
end

def sign_in_user
	click_link 'Sign in'
	fill_in 'Email', with: 'user@example.com'
	fill_in 'Password', with: 'password'
	click_button 'Sign in'
end





