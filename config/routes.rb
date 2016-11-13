Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'app/surveys#index'
  end

  root 'landing#index'

  scope module: 'app' do
    get 'surveys/get_list_view', as: 'get_list_view'
    get 'surveys/get_card_view', as: 'get_card_view'
    resources :surveys do
      resources :questions do
        resources :answers
      end
    end
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  get '*url' => 'errors#not_found'
end
