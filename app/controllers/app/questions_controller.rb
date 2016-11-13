class App::QuestionsController < AppController
  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new(title: 'Write here your question')
    respond_to do |format|
      format.js { render 'new' }
    end
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new(question_params)
    @question.save
    respond_to do |format|
      format.js { render 'create' }
    end
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end
end
