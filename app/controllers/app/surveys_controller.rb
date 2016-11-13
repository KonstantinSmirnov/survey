class App::SurveysController < AppController
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

  def show
    @survey = Survey.find(params[:id])
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:success] = "Deleted"
    redirect_to surveys_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
