class Respondent < ApplicationRecord
  has_one :response

  belongs_to :survey

end
