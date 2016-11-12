Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'app/dashboard#index'
  end

  root 'landing#index'

  scope module: 'app' do
    get '/dashboard' => 'app/dashboard#index', as: 'dashboard'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
