require 'rails_helper.rb'

feature 'User adds an recipe' do
    scenario 'User sucessfully navigates to the Add Recipe page from Home page' do
        visit root_path
        expect(page).to have_content('Featured Recipes')
        expect(page).to have_content('Recommended Recipes')
        expect(page).to have_content('New Recipes')
        click_link 'Add Recipe'
        expect(page).to have_field('Author')
        expect(page).to have_field('Serves')
        expect(page).to have_field('Prep Time (minutes)')
        expect(page).to have_field('Prep Time (minutes)')
        expect(page).to have_field('Recipe Name')
        expect(page).to have_field('Description')
        expect(page).to have_field('Ingredients')
        expect(page).to have_field('Directions')
    end
    
    scenario 'User successfully adds new recipe' do
        visit new_recipe_path
        fill_in 'Author', with: 'John Smith'
        fill_in 'Serves', with: '4'
        fill_in 'Prep Time (minutes)', with: '5'
        fill_in 'Cook Time (minutes)', with: '14'
        fill_in 'Recipe Name', with: 'Regular Steak'
        fill_in 'Description', with: 'Best steak you will ever eat!'
        fill_in 'Ingredients', with: 'Steak' "\n" 'Salt' "\n" 'Black Pepper'
        fill_in 'Directions', with: 'Season steak with salt and black peper, and put cook each side 7 minutes each'
        click_button 'Submit'
        expect(page).to have_content('John Smith')
        expect(page).to have_content('4')
        expect(page).to have_content('5')
        expect(page).to have_content('14')
        expect(page).to have_content('Regular Steak')
        expect(page).to have_content('Best steak you will ever eat')
        expect(page).to have_content('Steak' "\n" 'Salt' "\n" 'Black Pepper')
        expect(page).to have_content('Season steak with salt and black peper, and put cook each side 7 minutes each')
    end
end

feature"User views other recipes" do
    scenario "User successfully navigates to the Browse Recipe page from the Home page" do
        visit root_path
        expect(page).to have_content("Featured Recipes")
        expect(page).to have_content("Recommended Recipes")
        expect(page).to have_content("New Recipes")
        click_link "Browse Recipes"
        expect(page).to have_content(@recipe)
    end
end