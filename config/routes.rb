Myrottenpotatoes::Application.routes.draw do
  devise_for :users
  resources :movies
  root :to => redirect('/movies')
end