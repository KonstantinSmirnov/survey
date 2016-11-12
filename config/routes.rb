Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'app/dashboard#index'
  end

  root 'landing#index'

  scope module: 'app' do
    get '/dashboard' => 'app/dashboard#index', as: 'dashboard'
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  get '*url' => 'errors#not_found'
end
