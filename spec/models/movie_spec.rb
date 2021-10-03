require 'rails_helper'

RSpec.describe Movie, type: :model do
  let (:subject) { Movie.new }

  describe "Movie title" do
    it "Should be Movie title" do
      title = Movie.create(title: 'Sir.Doggy')
      expect(title.Movie_title).to eq("Sir.Doggy")

    end
  end

  describe "Movie description" do
    it "Should be Movie description" do
      description = Movie.create(description: 'Dodge like digital')
      expect(description.Movie_description).to eq("Dodge like digital")
    end
  end

  describe "Movie release date" do
    it "Should be Movie release date" do
      release = Movie.create(release_date: '25 December 1999')
      expect(release.Movie_release).to eq("1999-12-25 00:00:00 UTC")
    end
  end
end

