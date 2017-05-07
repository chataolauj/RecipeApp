require 'rails_helper.rb'
require 'support/factory_girl'

include Warden::Test::Helpers
Warden.test_mode!

feature 'User creates an account' do
    scenario 'User successfully creates a new login' do
        visit root_path
        click_link 'Register'
        fill_in 'Username', with: 'jd'
        fill_in 'Email', with: 'jd@gmail.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
        click_button 'Sign up'
        expect(page).to have_content('Welcome! You have signed up successfully.')
        Warden.test_reset!
    end
end

feature 'User logs in' do
    scenario 'User sucessfully logs in' do
        visit root_path
        click_link 'Login'
        user = FactoryGirl.create(:user)
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
        expect(page).to have_content('Signed in successfully.')
        Warden.test_reset!
    end
end

feature 'User adds a new recipe' do
    scenario 'User sucessfully adds a new recipe' do
        visit root_path
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)
        click_link 'Add Recipe'
        fill_in 'Serves', with: '4'
        fill_in 'Prep Time (minutes)', with: '5'
        fill_in 'Cook Time (minutes)', with: '14'
        fill_in 'Recipe Name', with: 'Regular Steak'
        fill_in 'Description', with: 'Best steak you will ever eat!'
        fill_in 'Ingredients', with: 'Steak' "\n" 'Salt' "\n" 'Black Pepper'
        fill_in 'Directions', with: 'Season steak with salt and black peper, and cook each side for 7 minutes'
        click_button 'Submit'
        expect(page).to have_content('4')
        expect(page).to have_content('5')
        expect(page).to have_content('14')
        expect(page).to have_content('Regular Steak')
        expect(page).to have_content('Best steak you will ever eat')
        expect(page).to have_content('Steak' "\n" 'Salt' "\n" 'Black Pepper')
        expect(page).to have_content('Season steak with salt and black peper, and cook each side for 7 minutes')
        Warden.test_reset!
    end
end

feature 'User views other recipes' do
    scenario 'User successfully navigates to the Browse Recipe page from the Home page' do
        visit root_path
        expect(page).to have_content("Featured Recipes")
        expect(page).to have_content("Recommended Recipes")
        expect(page).to have_content("New Recipes")
        click_link 'Browse Recipes'
        expect(page).to have_content(@recipe)
    end
end

feature 'User logs out' do
    scenario 'User successfully logs out' do
        visit root_path
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)
        logout(:user)
    end
end