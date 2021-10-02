Myrottenpotatoes::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :movies
  root :to => redirect('/movies')
end