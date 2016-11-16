class App::AnswersController < AppController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(title: 'Write here your answer')
    respond_to do |format|
      format.js { render 'new', locals: { id: Time.now, answer: @answer } }
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    respond_to do |format|
      format.js { render 'destroy', locals: { answer: @answer } }
    end
  end

end
