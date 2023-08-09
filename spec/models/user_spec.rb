require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
  end
  describe "associations" do
    it { should have_many(:flight_users) }
    it { should have_many(:flights).through(:flight_users).class_name("Flight") }
  end
end
