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
      3.times { @question.answer_variants.create(title: "") }
    when "multiply"
      @question.multiply!
      3.times { @question.answer_variants.create(title: "") }
    when "text"
      @question.text!
      @question.answer_variants.create(title: "")
    when "scale"
      @question.scale!
      @question.answer_variants.create(title: "")
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
        format.js { render 'update', locals: { question: @question } }
      else
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

  def show_description
    respond_to do |format|
      format.js { render 'show_description', locals: { question: @question } }
    end
  end
  
  def add_image
    respond_to do |format|
      format.js { render 'add_image', locals: { question: @question } }
    end
  end
  
  def delete_image
    @question = Question.find(params[:question_id])
    @question.image.clear
    @question.save
    respond_to do |format|
      format.js { render 'delete_image', locals: { question: @question } }
    end
  end

  def sort
    params[:question].each_with_index do |id, index|
      Question.find(id).update_attribute(:position, index + 1)
    end
    
    render nothing: true
  end

  private

  def question_params
    params.require(:question).permit(:title, :mandatory, :description, :image,
      :answer_variants_attributes => [:id, :title, :_destroy]
                                    )
  end

end
