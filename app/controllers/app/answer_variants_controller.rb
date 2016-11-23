class App::AnswerVariantsController < AppController

  def new
    @question = Question.find(params[:question_id])
    @answer_variant = @question.answer_variants.new(title: 'Write here your answer')
    respond_to do |format|
      format.js { render 'new', locals: { id: Time.now, answer_variant: @answer_variant } }
    end
  end

  def destroy
    @answer_variant = AnswerVariant.find(params[:id])
    @answer_variant.destroy
    respond_to do |format|
      format.js { render 'destroy', locals: { answer_variant: @answer_variant } }
    end
  end

end
