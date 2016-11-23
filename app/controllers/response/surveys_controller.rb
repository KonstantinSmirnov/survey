class Response::SurveysController < ResponseController

  def show
    @survey = Survey.find_by(encrypted_link: params[:id])
  end
 
end
