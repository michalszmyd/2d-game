require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'hero validates' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :wear_place }
    it { is_expected.to validate_presence_of :damage }
    it { is_expected.to validate_presence_of :mana }
    it { is_expected.to validate_presence_of :armor }
  end

  describe 'hero assoc' do
    it { is_expected.to belong_to :hero_role }
    it { is_expected.to have_many(:hero_items) }
    it { is_expected.to have_many(:heroes).through(:bag_items) }
  end
end
