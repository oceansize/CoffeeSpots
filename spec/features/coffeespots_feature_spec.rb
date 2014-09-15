require 'rails_helper'

describe 'CoffeeSpots listings page' do

    before (:each) do
        create_user
        visit root_path
    end

    it 'initially shows no coffeespots' do
        expect(page).not_to have_content 'Test CoffeeSpot'
    end

    it 'users cannot add coffeespots unless signed in' do
        expect(page).not_to have_link 'Add CoffeeSpot'
    end

    it 'users can add coffeespots if signed in' do
        sign_in_user
        click_link 'Click To Add Your Favourite CoffeeSpot'
        fill_in 'Name', with: 'Test Coffeespot'
        fill_in 'Url', with: 'http://test_url.com'
        click_button 'Add Spot'
        expect(page).to have_content 'Test Coffeespot'
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

