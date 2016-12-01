class AnswerVariant < ApplicationRecord

  belongs_to :question
  has_many :responses, dependent: :destroy

  has_attached_file :image, styles: { medium: "640x480#" }, :default_url => "default-thumbnail.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
