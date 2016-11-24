class Survey < ApplicationRecord
  require 'securerandom'

  validates :title, :description, :user, presence: true
  before_create :generate_encrypted_link

  enum status: [:active, :inactive]

  belongs_to :user
  has_many :questions
  
  has_many :respondents
  
  private

  def generate_encrypted_link
    self.encrypted_link = SecureRandom.uuid
  end
end
