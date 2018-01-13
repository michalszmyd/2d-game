require 'rails_helper'

RSpec.describe BagItem, type: :model do
  describe 'assoc' do
    it { is_expected.to belong_to :bag }
    it { is_expected.to belong_to :item }
  end
end
