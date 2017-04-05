class RecipesController < ApplicationController
    def index
        @recipe = Recipes.all
    end
    
    def show
        @recipe = Recipes.find(params[:id])
    end
    
    def new
        @recipe = Recipes.new
    end
    
    def create
        @recipe = Recipes.new(recipe_params)
        
        if @recipe.save
            redirect_to @recipe
        else
            render 'new'
        end
    end
end

private
    def recipe_params
        params.require(:recipe).permit(:author, :servings, :prep_time, :cook_time, :recipe_name, :description, :ingredients, :directions)
    end
