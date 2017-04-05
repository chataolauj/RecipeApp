class RecipeController < ApplicationController
    def index
        @recipe = Recipes.all
    end
    
    def new
        
    end
    
    def create
        @recipe = Recipes.new(recipe_params)
        
        @recipe.save
        redirect_to @recipe
    end
    
    def show
        @recipe = Recipes.find(params[:id])
    end
end

private
    def recipe_params
        params.require(:recipe).permit(:author, :servings, :prep_time, :cook_time, :recipe_name, :description, :ingredients, :directions)
    end