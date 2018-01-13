require 'rails_helper'

RSpec.describe HeroRole, type: :model do
  describe 'role validates' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'assoc' do
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:heroes) }
  end
end
