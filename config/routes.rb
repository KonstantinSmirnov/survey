Rails.application.routes.draw do
  get 'landing/index', as: 'landing'
  root 'landing#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
