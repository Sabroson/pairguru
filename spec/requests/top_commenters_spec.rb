require "rails_helper"

describe "Comments requests", type: :request do
  describe "top commenters list" do
    it "displays right title" do
      visit "/top-commenters"
      expect(page).to have_selector("h1", text: "Top Commenters")
    end
  end
end
