class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum surveys_view: [:surveys_list_view, :surveys_card_view]
  enum locale: [:en, :ru, :es]

  has_many :surveys, dependent: :destroy
end
