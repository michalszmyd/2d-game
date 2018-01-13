require 'rails_helper'

RSpec.describe Hero, type: :model do
  describe 'hero validates' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :hero_role }
    it { is_expected.to validate_presence_of :strength }
    it { is_expected.to validate_presence_of :agility }
    it { is_expected.to validate_presence_of :inteligence }
  end

  describe 'hero assoc' do
    it { is_expected.to belong_to :hero_role }
    it { is_expected.to belong_to :user }
  end
end
