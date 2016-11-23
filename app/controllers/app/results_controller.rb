class App::ResultsController < AppController
  add_breadcrumb "Surveys", :root_path
  
  def show
    @survey = Survey.find(params[:id])
    add_breadcrumb "Results: #{@survey.title}"
  end
end