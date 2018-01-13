require 'rails_helper'

RSpec.describe Bag, type: :model do
  describe 'role validates' do
    it { is_expected.to validate_presence_of(:hero) }
    it { is_expected.to validate_presence_of(:size) }
  end
end
