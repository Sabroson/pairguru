require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
    user = create(:user)
    movie = create(:movie)
    comment = build(:comment, user: user, movie: movie)
    expect(comment).to be_valid
  end

  it "is not valid with no content" do
    user = create(:user)
    movie = create(:movie)
    comment = build(:empty_comment, user: user, movie: movie)
    expect(comment).to_not be_valid
  end

  it "is not valid if it is the second comment for the same movie by the same user" do
    user = create(:user)
    movie = create(:movie)
    create(:comment, user: user, movie: movie)
    second_comment = build(:comment, user: user, movie: movie)
    expect(second_comment).to_not be_valid
  end
end
