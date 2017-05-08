class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @recipe = Recipe.all
    end
    
    def show
        
    end
    
    def new
        @recipe = current_user.recipes.build
    end
    
    def create
        @recipe = current_user.recipes.build(recipe_params)
        
        if @recipe.save
            redirect_to @recipe
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render 'edit'
        end
    end
    
    def destroy
        @recipe.destroy
        
        redirect_to recipes_path
    end
    
    private
    
        def set_recipe
            @recipe = Recipe.find(params[:id])
        end
        
        def recipe_params
            params.require(:recipe).permit(:author, :servings, :prep_time, :cook_time, :recipe_name, :description, :ingredients, :directions, :image)
        end
end
