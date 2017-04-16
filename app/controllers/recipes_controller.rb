class RecipesController < ApplicationController
    def index
        @recipe = Recipe.all
    end
    
    def show
        @recipe = Recipe.find(params[:id])
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        
        if @recipe.save
            redirect_to @recipe
        else
            render 'new'
        end
    end
    
    def edit
        @recipe = Recipe.find(params[:id])
    end
    
    def update
        @recipe = Recipe.find(params[:id])
        
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render 'edit'
        end
    end
    
    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        
        redirect_to recipes_path
    end
end

private
    def recipe_params
        params.require(:recipe).permit(:author, :servings, :prep_time, :cook_time, :recipe_name, :description, :ingredients, :directions, :image)
    end
