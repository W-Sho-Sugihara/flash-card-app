class Deck < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :cards, dependent: :destroy
end
