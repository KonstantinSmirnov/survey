class App::ResultsController < AppController

  def show
    @survey = Survey.find(params[:id])
  end
end
