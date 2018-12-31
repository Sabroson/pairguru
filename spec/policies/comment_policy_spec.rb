require 'rails_helper'

describe CommentPolicy do
  subject { described_class.new(user, comment) }

  context "a visitor" do
    let(:user) { nil }
    let(:comment) { create(:comment, user: create(:user), movie: create(:movie)) }

    it { is_expected.to forbid_action(:destroy) }
  end

  context "a user who was not the comment writer" do
    let(:user) { create(:user) }
    let(:comment) { create(:comment, user: create(:user), movie: create(:movie)) }

    it { is_expected.to forbid_action(:destroy) }
  end

  context "the user who wrote the comment" do
    let(:user) { create(:user) }
    let(:comment) { create(:comment, user: user, movie: create(:movie)) }

    it { is_expected.to permit_action(:destroy) }
  end
end
