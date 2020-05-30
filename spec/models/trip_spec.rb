require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'relationships' do
    it { should belong_to :place }
    it { should belong_to :user }
  end
end
