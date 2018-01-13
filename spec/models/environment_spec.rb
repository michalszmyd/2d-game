require 'spec_helper'

RSpec.describe Environment, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :permeable }
  end

  describe 'assocs' do
    it { is_expected.to have_many(:world_environments) }
    it { is_expected.to have_many(:worlds).through(:world_environments) }
  end
end
