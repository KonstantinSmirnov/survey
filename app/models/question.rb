class Question < ApplicationRecord
  validates :title, presence: true

  belongs_to :survey
end
