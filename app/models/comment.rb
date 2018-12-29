# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  content     :text
#  movie_id    :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
