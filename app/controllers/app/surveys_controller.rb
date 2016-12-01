class App::SurveysController < AppController

  def index
    @surveys = current_user.surveys.order("position DESC")
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = current_user.surveys.new(survey_params)
    if @survey.save
      # flash[:success] = "New survey created!"
      redirect_to edit_app_survey_path(@survey)
    else
      flash.now[:danger] = "You entered incorrect data. Try again."
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    @questions = @survey.questions.order("position")
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      redirect_to edit_app_survey_path(@survey)
    else
      flash.now[:danger] = "Can not be updated"
      render 'edit'
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to app_surveys_path
  end

  def get_list_view
    current_user.surveys_list_view!
    redirect_to app_surveys_path
  end

  def get_card_view
    current_user.surveys_card_view!
    redirect_to app_surveys_path
  end

  def activate
    @survey = Survey.find(params[:survey_id])
    @survey.active? ? @survey.inactive! : @survey.active!

    respond_to do |format|
      format.js { render 'activate', locals: { survey: @survey } }
    end
  end

  def edit_header
    @survey = Survey.find(params[:id])

    respond_to do |format|
      format.js { render 'edit_header', locals: { survey: @survey } }
    end
  end
  
  def sort
    params[:survey].each_with_index do |id, index|
      Survey.find(id).update_attribute(:position, params[:survey].count - index)
    end
    
    render nothing: true
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description, :position)
  end
end
