class CommentsController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_id]) #retrieves the current recipe and saves it to the @recipe object
        @comment = @recipe.comments.create(comments_params) #creates the @comments object with the parameters passed to it by the view
        @comment.user_id = current_user.id
        
        if @comment.save
            redirect_to recipe_path(@recipe) #redirects back to the page with the article and new comments
        else
            flash.now[:danger] = 'Error! Comment could not be posted...'
        end
    end
    
    def destroy
       @recipe = Recipe.find(params[:recipe_id]) #finds current recipe
       @comment = @recipe.comments.find(params[:id]) #locates comment within the @artciles
       @comment.destroy #removes comment from database
       redirect_to recipe_path(@recipe) #redirects to the recipe
    end
end

private
    def comments_params
        params.require(:comment).permit(:name, :comment, :rating)
    end