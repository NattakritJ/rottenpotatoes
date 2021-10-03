require 'rails_helper'

RSpec.describe Review, type: :model do

  describe "Add Comment" do
    it "Should be Add Comment" do
      comments = Review.create(comments: 'Dodge like digital')
      expect(comments.Review_comments).to eq("Dodge like digital")
    end
  end


  describe "Add Score" do
    it "Should be Add Score" do
      potatoes = Review.create(potatoes: '4')
      expect(potatoes.Review_scores).to eq("4")
    end
  end
end