require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user assoc' do
    it { is_expected.to have_many :heroes }
  end
end
