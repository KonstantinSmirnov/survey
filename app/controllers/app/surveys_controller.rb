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
      redirect_to edit_survey_path(@survey)
    else
      flash[:danger] = "You entered incorrect data. Try again."
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    add_breadcrumb "Edit: #{@survey.title}"
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      flash[:success] = "Updated"
      redirect_to edit_survey_path(@survey)
    else
      flash.now[:danger] = "Can not be updated"
      render 'edit'
    end
  end

  def show
    @survey = Survey.find(params[:id])
    add_breadcrumb "#{@survey.title}"
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

  private

  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
