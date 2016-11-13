class App::QuestionsController < AppController

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new(title: 'Write here your question')
    case params[:question_type]
    when "single"
      @question.single!
    when "multiply"
      @question.multiply!
    when "text"
      @question.text!
    end
    @question.save
    respond_to do |format|
      format.js { render 'create' }
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.js { render 'destroy', locals: {id: @question.id} }
    end
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end
end
