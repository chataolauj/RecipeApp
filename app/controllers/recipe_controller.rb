class RecipeController < ApplicationController
    def index
    end
    
    def new
        
    end
    
    def create
        render plain: params[:recipe].inspect
    end
    
    def show
        
    end
end