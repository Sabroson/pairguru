class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @movie = Movie.find(params[:movie_id])
    @comment.movie = @movie
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to movie_path(@movie) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "movies/show" }
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.destroy
      respond_to do |format|
        format.html do
          redirect_to movie_path(@comment.movie)
        end
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_back(fallback_location: movie_path(@comment.movie), alert: "The comment couldn't be deleted.")}
        format.js
      end
    end
  end

  def top_commenters
    @top_commenters = Comment.joins(:user).where("comments.created_at >= ?", 7.days.ago).group(:user).order("count_users_id desc").count("users.id").first(10)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
