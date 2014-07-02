require 'rails_helper'

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

# describe 'Coffee House creation form' do
#   context '' do
#     it 'should be able to create a coffee house listing' do
#       visit '/restaurants/new'
#       fill_in 'Name', with: 'Milk Bar'
#       click_button 'Create CoffeeSpot'
#     end
#   end
# end