class App::LocalesController < AppController

  def update
    current_user.send("#{params[:locale]}!")
    redirect_to request.referrer
  end
end
