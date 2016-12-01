class Question < ApplicationRecord
  acts_as_list

  enum question_type: [:single, :multiply, :text, :scale]

  belongs_to :survey
  has_many :answer_variants, dependent: :destroy

  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :answer_variants, :allow_destroy => true
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
