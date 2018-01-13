require 'spec_helper'

RSpec.describe Environment, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :permeable }
  end
end
