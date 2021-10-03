require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Review potatoes" do
    it "Should be Review potatoes" do
      email = User.create(email: '5')
      expect(email.User_email).to eq('5')
    end
  end

end
