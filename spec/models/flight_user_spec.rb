require "rails_helper"

RSpec.describe FlightUser, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:flight) }
end
