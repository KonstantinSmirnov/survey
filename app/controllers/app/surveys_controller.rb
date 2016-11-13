class App::SurveysController < AppController
  add_breadcrumb "Surveys", :root_path

  def index
    @surveys = current_user.surveys
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = current_user.surveys.new(survey_params)
    if @survey.save
      flash[:success] = "New survey created!"
      redirect_to root_path
    else
      flash[:danger] = "You entered incorrect data. Try again."
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      flash[:success] = "Updated"
      redirect_to @survey
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
    flash[:success] = "Deleted"
    redirect_to surveys_path
  end

  def get_list_view
    current_user.surveys_list_view!
    flash[:success] = "Surveys list view"
    redirect_to surveys_path
  end

  def get_card_view
    current_user.surveys_card_view!
    flash[:success] = "Surveys card view"
    redirect_to surveys_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
