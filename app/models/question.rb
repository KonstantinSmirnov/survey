class Question < ApplicationRecord

  enum question_type: [:single, :multiply, :text]

  belongs_to :survey
  has_many :answer_variants

  has_many :responses

  accepts_nested_attributes_for :answer_variants, :allow_destroy => true

end
