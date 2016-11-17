class Survey < ApplicationRecord
  validates :title, :description, :user, presence: true

  enum status: [:active, :inactive]

  belongs_to :user
  has_many :questions
end
