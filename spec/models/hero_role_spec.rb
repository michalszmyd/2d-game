require 'rails_helper'

RSpec.describe HeroRole, type: :model do
  describe 'role validates' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
