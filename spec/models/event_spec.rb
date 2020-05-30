require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :date }
  end

  describe 'relationships' do
    it { should belong_to :place }
  end
end
