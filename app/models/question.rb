class Question < ApplicationRecord
  validates :title, presence: true

  enum question_type: [:single, :multiply, :text]

  belongs_to :survey
  has_many :answers
end
