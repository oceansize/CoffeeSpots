require 'rails_helper'

# describe 'Writing reviews' do

# 	before (:each) do
# 		Coffeespot.create(name: 'Costa', url: 'http://costa.co.uk')
# 	end

# 	it 'should add the review to the CoffeeSpot' do
# 		visit '/coffeespots'
# 		click_link 'Review'
# 		fill_in 'Thoughts', with: 'Turd.'
# 		select '1', from: 'Rating'
# 		click_button 'Create Review'
# 		expect(page).to have_content 'Turd. (1)'
# 	end
# end