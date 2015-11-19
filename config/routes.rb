Rails.application.routes.draw do

   devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :tasks do
collection  do
  get :complete
end
member do
  put :completed
end
end
resources :products
 root "home#index"
end
