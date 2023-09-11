class Deck < ApplicationRecord
  has_many :relationships
  has_many :users, through: :relationships
  has_many :cards, dependent: :destroy

  validates :name, presence: true
end
