Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'app/surveys#index'
  end

  root 'landing#index'

  namespace :app do
    post 'locales/:locale', to: 'locales#update', as: 'update_locale'
    get 'surveys/get_list_view', as: 'get_list_view'
    get 'surveys/get_card_view', as: 'get_card_view'
    get 'surveys/:id/edit_header', to: 'surveys#edit_header', as: 'edit_survey_header'
    get 'surveys/:id/show_results', to: 'results#show', as: 'show_survey_results'
    resources :surveys do
      get 'surveys/activate', as: 'activate'
      collection { post :sort }
      resources :questions do
        collection { post :sort }
        get 'show_description', to: 'questions#show_description', as: 'show_description'
        resources :answer_variants
      end
    end
  end

  scope module: 'visitor' do
    resources :surveys, only: [:show]
    resources :responses, only: [:create, :index]
    # resources :respondents
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  get '*url' => 'errors#not_found'
end
