class AnswerVariant < ApplicationRecord

  belongs_to :question
  has_many :responses, dependent: :destroy
end
