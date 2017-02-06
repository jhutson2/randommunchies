Rails.application.routes.draw do
  resources :ingredients
  resources :recipes
  resources :api_recipes

  root "recipes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get    '/auth/:provider'          => 'omniauth#auth',    as: :auth
  get    '/auth/:provider/callback' => 'session#create'
  get    '/auth/failure'            => 'session#failure'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  get 'search' => 'recipes#index'

end
