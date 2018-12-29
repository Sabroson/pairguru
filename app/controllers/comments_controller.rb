class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.movie = Movie.find(params[:movie_id])
    @comment.user = current_user
    @comment.save
    redirect_to movie_path(@comment.movie)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    movie = Movie.find(params[:movie_id])
    redirect_to movie_path(movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
