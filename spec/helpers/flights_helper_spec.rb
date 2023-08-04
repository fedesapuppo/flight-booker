require "rails_helper"

RSpec.describe FlightsHelper, type: :helper do
  describe "#format_datetime" do
    it "formats the datetime correctly" do
      datetime = DateTime.new(2023, 8, 10, 12, 30)
      formatted_datetime = helper.format_datetime(datetime)
      expect(formatted_datetime).to eq("August 10, 2023, 12:30 PM")
    end
  end
end
