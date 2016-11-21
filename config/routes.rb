Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'app/surveys#index'
  end

  root 'landing#index'

  namespace :app do
    get 'surveys/get_list_view', as: 'get_list_view'
    get 'surveys/get_card_view', as: 'get_card_view'
    get 'surveys/:id/edit_header', to: 'surveys#edit_header', as: 'edit_survey_header'
    resources :surveys do
      get 'surveys/activate', as: 'activate'
      resources :questions do
        resources :answers
      end
    end
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  get '*url' => 'errors#not_found'
end
