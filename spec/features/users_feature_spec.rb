require 'rails_helper'

describe 'CoffeeSpots User features' do
  context 'New user page' do
    it 'should have a descriptive header' do
      visit '/users/new'
      expect(page).to have_content('Create a New User')
    end
  end

  context 'Existing users page' do
    before{User.create name: 'Roi', email: 'test@test.com'}
    it 'should display all users' do
      visit '/users'
      expect(page).to have_content('test@test.com')
    end
  end

end