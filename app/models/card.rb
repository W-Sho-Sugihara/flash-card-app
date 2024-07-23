class Card < ApplicationRecord
  validates :question, presence: :true

  belongs_to :deck
end
