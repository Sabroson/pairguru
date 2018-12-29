class CommentsValidator < ActiveModel::Validator
  def validate(record)
    unless record.user.comments.where(movie: record.movie).count.zero?
      record.errors[:base] << "You can't add more than one comment per movie"
    end
  end
end
