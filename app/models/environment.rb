class Environment < ApplicationRecord
  validates :name, :permeable, presence: true
end
