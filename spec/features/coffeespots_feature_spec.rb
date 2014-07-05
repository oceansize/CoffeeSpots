require 'rails_helper'  # ~> LoadError: cannot load such file -- rails_helper

describe 'CoffeeSpots listings page' do
  context 'when there are none' do
    it 'tells me there are no coffee spots' do
      visit '/coffeespots'
      expect(page).to have_content 'There are no Coffee Spots yet.'
    end
  end

  context 'when there are coffee spots' do
    before do
      Coffeespot.create(name: 'Flat White')
    end
    it 'should show the listed shops' do
        visit '/coffeespots'
        expect(page).to have_content 'Flat White'
    end
  end
end

describe 'Coffee House creation form' do
  it 'should be able to create a coffee house listing' do
    visit '/coffeespots/new'

    fill_in 'Name', with: 'Milk Bar'
    fill_in 'Url', with: 'http://www.flatwhitecafe.com/milkbar.html'
    click_button 'Create Coffeespot'

    expect(current_path).to eq '/coffeespots'
    expect(page).to have_content 'Milk Bar url'
  end
end

describe 'Coffee Spot edit form' do
  before{Coffeespot.create name: 'Monmouth', url: 'http://www.monmouthcoffee.co.uk'}

  it 'should be able to edit a Coffee Spot listing' do
    visit '/coffeespots'
    click_link 'Edit'

    fill_in 'Name', with: 'Monmouth Coffee'
    click_button 'Update Coffeespot'

    expect(current_path).to eq '/coffeespots'
    expect(page).to have_content 'Monmouth Coffee'
  end

  it 'should be able to delete a listing' do
    visit '/coffeespots'
    click_link 'Delete Monmouth'

    expect(page).not_to have_content 'Delete Monmouth'
    expect(page).to have_content 'Monmouth successfully deleted'
  end
end