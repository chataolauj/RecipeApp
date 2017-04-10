class CommentsController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_id]) #retrieves the current article and saves it to the @article object
        @comment = @recipe.comments.create(comments_params) #creates the @comments object with the parameters passed to it by the view
        redirect_to recipe_path(@recipe) #redirects back to the page with the article and new comments
    end
    
    private
        def comments_params
            params.require(:comment).permit(:name, :comment, :rating)
        end
end
