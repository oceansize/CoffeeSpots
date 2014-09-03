require 'rails_helper'

describe 'CoffeeSpots listings page' do

    context 'when there are none' do
 
        it 'tells me there are no coffee spots' do
            visit '/coffeespots'
            expect(page).to have_content 'No Coffee Spots yet'
        end
 
    end

    context 'when there are coffee spots' do

        it 'should show the listed spots' do
            Coffeespot.create(name: 'Flat White')
            visit '/coffeespots'
            expect(page).to have_content 'Flat White'
        end
    end
end


# describe 'Coffee House creation form' do

#     it 'should be able to create a coffee house listing' do
#         @user = User.create(email: 'alex@example.com', password: '12345678', password_confirmation: '12345678')
#         visit new_user_session_path
#         fill_in 'Email', with: 'alex@example.com'
#         fill_in 'Password', with: '12345678'
#         click_button 'Sign in'
#         click_link 'Add CoffeeSpot'
#         fill_in 'Name', with: 'Milk Bar'
#         fill_in 'Url', with: 'http://www.flatwhitecafe.com/milkbar.html'
#         click_link 'Add CoffeeSpot'
#         expect(page).to have_content 'Milk Bar url'
#     end

# end

# describe 'Coffee Spot edit form' do

#     before (:each) do
#         Coffeespot.create(name: 'Monmouth', url: 'http://www.monmouthcoffee.co.uk')
#     end

# context 'when logged in' do
#   it 'should be able to edit a Coffee Spot listing' do
#     visit '/coffeespots'
#     click_link 'Edit'
#     fill_in 'Name', with: 'Monmouth Coffee'
#     click_button 'Update Coffeespot'
#     expect(current_path).to eq '/coffeespots'
#     expect(page).to have_content 'Monmouth Coffee'
#   end

#   it 'should be able to delete a listing' do
#     visit '/coffeespots'
#     click_link 'Delete Monmouth'
#     expect(page).not_to have_content 'Delete Monmouth'
#     expect(page).to have_content 'Monmouth successfully deleted'
#   end
# end

    # context 'when logged out' do
 
    #     it 'should not be possible to edit a listing' do
    #         visit '/coffeespots'
    #         expect(page).not_to have_link('Edit')
    #     end

    #     it 'should not be able to delete a listing' do
    #         visit '/coffeespots'
    #         expect(page).not_to have_link('Delete Monmouth')
    #     end
    # end

# end











