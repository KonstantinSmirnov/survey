class SurveysController < ApplicationController
  def show
    @survey = Survey.find_by(encrypted_link: params[:id])
  end
end
