require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "associations" do
    it { should belong_to(:departure_airport).class_name("Airport") }
    it { should belong_to(:arrival_airport).class_name("Airport") }
  end

  describe "columns" do
    it { should have_db_column(:departure_airport_id).of_type(:integer) }
    it { should have_db_column(:arrival_airport_id).of_type(:integer) }
  end
end
