require 'rails_helper'

RSpec.describe TripEvent, type: :model do
  describe "relationships" do
    it { should belong_to :trip }
    it { should belong_to :event }
  end
end
