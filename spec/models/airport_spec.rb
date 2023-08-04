require "rails_helper"

RSpec.describe Airport, type: :model do
  describe "validations" do
    it "is valid with a code" do
      airport = Airport.new(code: "SFO")
      expect(airport).to be_valid
    end

    it "is not valid without a code" do
      airport = Airport.new(code: nil)
      expect(airport).not_to be_valid
    end

    it "is not valid with a duplicate code" do
      Airport.create!(code: "SFO")
      airport = Airport.new(code: "SFO")
      expect(airport).not_to be_valid
    end
  end
end
