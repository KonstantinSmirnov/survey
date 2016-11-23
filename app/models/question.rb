class Question < ApplicationRecord

  enum question_type: [:single, :multiply, :text]

  belongs_to :survey
  has_many :answers
  
  has_many :responces

  accepts_nested_attributes_for :answers, :allow_destroy => true

end
