require 'spec_helper'

RSpec.describe WorldEnvironment, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of :world }
    it { is_expected.to validate_presence_of :environment }
    it { is_expected.to validate_presence_of :position_x }
    it { is_expected.to validate_presence_of :position_y }
  end

  describe 'assocs' do
    it { is_expected.to belong_to :world }
    it { is_expected.to belong_to :environment }
  end
end
