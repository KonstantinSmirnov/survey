class Survey < ApplicationRecord
  require 'securerandom'

  validates :title, :description, :user, presence: true
  before_create :generate_encrypted_link

  enum status: [:active, :inactive]

  belongs_to :user
  has_many :questions, dependent: :destroy

  has_many :respondents, dependent: :destroy

  private

  def generate_encrypted_link
    self.encrypted_link = SecureRandom.hex(5)
  end
end
