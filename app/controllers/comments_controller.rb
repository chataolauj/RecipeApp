class CommentsController < ApplicationController
    before_action :find_recipe
    before_action :find_comment, only: [:destroy]
    
    def create
        @comment = @recipe.comments.create(comments_params) #creates the @comments object with the parameters passed to it by the view
        @comment.user_id = current_user.id
        @comment.name = current_user.username
        
        if @comment.save
            redirect_to recipe_path(@recipe) #redirects back to the page with the article and new comments
        else
            flash.now[:danger] = 'Error! Comment could not be posted...'
        end
    end
    
    def destroy
       
       @comment.destroy #removes comment from database
       redirect_to recipe_path(@recipe) #redirects to the recipe
    end
    
    private
    
        def find_recipe
            @recipe = Recipe.find(params[:recipe_id]) #finds current recipe
        end
        
        def find_comment
            @comment = @recipe.comments.find(params[:id]) #locates comment within the @recipe
        end
    
        def comments_params
            params.require(:comment).permit(:name, :comment, :rating)
        end
end

