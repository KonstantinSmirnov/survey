class App::QuestionsController < AppController

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.js { render 'show', locals: { question: @question } }
    end
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new(title: '')
    case params[:question_type]
    when "single"
      @question.single!
      3.times { @question.answers.create(title: "") }
    when "multiply"
      @question.multiply!
      3.times { @question.answers.create(title: "") }
    when "text"
      @question.text!
      @question.answers.create(title: "")
    end
    @question.save
    respond_to do |format|
      format.js { render 'create', locals: { question: @question } }
    end
  end

  def edit
    @question = Question.find(params[:id])
    respond_to do |format|
      format.js { render 'edit', locals: { question: @question } }
    end
  end

  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(question_params)
        flash.now[:success] = "Updated"
        format.js { render 'update', locals: { question: @question } }
      else
        flash.now[:danger] = "Could not update"
        format.js { render 'error_message' }
      end
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
    params.require(:question).permit(:title,
      :answers_attributes => [:id, :title, :_destroy]
                                    )
  end
end
