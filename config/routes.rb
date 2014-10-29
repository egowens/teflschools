Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  #Home page
  root 'static_pages#home'

  #Static Pages
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'

  #School Pages
  resources :schools
end
