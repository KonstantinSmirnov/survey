class App::AnswersController < AppController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(title: 'Write here your answer')
    @answer.save
    respond_to do |format|
      format.js { render 'create', locals: {id: @question.id} }
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    respond_to do |format|
      format.js { render 'destroy', locals: {id: @answer.id} }
    end
  end

end
