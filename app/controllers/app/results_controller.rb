class App::ResultsController < AppController

  def show
    @survey = Survey.find(params[:id])
    @questions = @survey.questions.order("position")
  end
end
