Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users do
    resources :binges
  end
  resources :shows
  get '/log-in'=> 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out
end
