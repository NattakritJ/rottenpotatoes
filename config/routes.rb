Myrottenpotatoes::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :movies do
    resources :reviews
  end
  root :to => redirect('/movies')
  post '/movies/search_tmdb'
end