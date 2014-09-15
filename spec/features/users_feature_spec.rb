require 'rails_helper'

describe 'Users registration' do

    it 'users can sign up' do
        visit new_user_registration_path
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
        expect(page).to have_content 'Signed up successfully'
    end

    it 'usrs can sign in' do
        create_user
        visit new_user_session_path
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Sign in'
        expect(page).to have_content 'Signed in successfully'
    end

    it 'users can sign out' do
        create_user
        visit new_user_session_path
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Sign in'
        expect(page).not_to have_link 'Sign in'
        click_link('Sign out')
        expect(page).to have_link 'Sign in'
    end

    it 'users cannot sign out when alreay signed out' do
        create_user
        visit root_path
        sign_in_user
        click_link 'Sign out'
        expect(page).not_to have_link 'Sign out'
        expect(page).to have_link 'Sign in'
        expect(page).to have_link 'Sign up'
    end

end


def create_user (email = "user@example.com", password = "password", password_confirmation = "password")
    User.create(email: email, password: password, password_confirmation: password_confirmation)
end

def sign_in_user
    click_link 'Sign in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
end