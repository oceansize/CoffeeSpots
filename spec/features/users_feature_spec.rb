require 'rails_helper'

describe 'CoffeeSpots User features' do

    context 'New user page' do

        it 'should have a descriptive header' do
            visit new_user_registration_path
                expect(page).to have_content('Sign up')
            end
        end
    end

describe 'users registration' do

    it 'can sign up' do
        visit new_user_registration_path
        fill_in 'Email', with: 'alex@example.com'
        fill_in 'Password', with: '12345678'
        fill_in 'Password confirmation', with: '12345678'
        click_button 'Sign up'
        expect(page).to have_content 'Signed up successfully'
    end

    it 'can sign in' do
        User.create(email: 'alex@example.com', password: '12345678', password_confirmation: '12345678')
        visit new_user_session_path
        fill_in 'Email', with: 'alex@example.com'
        fill_in 'Password', with: '12345678'
        click_button 'Sign in'
        expect(page).to have_content 'Signed in successfully'
    end

    it 'can sign out' do
        User.create(email: 'alex@example.com', password: '12345678', password_confirmation: '12345678')
        visit new_user_session_path
        fill_in 'Email', with: 'alex@example.com'
        fill_in 'Password', with: '12345678'
        click_button 'Sign in'
        expect(page).not_to have_link('Sign in')
        click_link('Sign out')
        expect(page).to have_link('Sign in')
    end

    it 'when signed out' do
        visit '/'
        expect(page).not_to have_link('Sign out')
        expect(page).to have_link('Sign in')
        expect(page).to have_link('Sign up')
    end

end

