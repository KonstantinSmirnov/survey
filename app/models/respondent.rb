class Respondent < ApplicationRecord
  has_one :response

  belongs_to :survey, dependent: :destroy

end
