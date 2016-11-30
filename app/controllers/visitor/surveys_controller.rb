class Visitor::SurveysController < VisitorController

  def show
    @survey = Survey.find_by(encrypted_link: params[:id])
    @questions = @survey.questions.order("position")
  end
 
end
