class CommentsController < ApplicationController
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
    @comment.destroy
    movie = Movie.find(params[:movie_id])
    redirect_to movie_path(movie)
  end

  def top_commenters
    @top_commenters = Comment.joins(:user).where("comments.created_at >= #{Time.zone.today - 7}").group("users.email").order("count_users_email desc").count("users.email").first(10)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
