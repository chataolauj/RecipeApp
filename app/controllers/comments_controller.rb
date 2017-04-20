class CommentsController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_id]) #retrieves the current article and saves it to the @article object
        @comment = @recipe.comments.create(comments_params) #creates the @comments object with the parameters passed to it by the view
        redirect_to recipe_path(@recipe) #redirects back to the page with the article and new comments
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