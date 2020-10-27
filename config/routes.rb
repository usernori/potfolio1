Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }
  root "home#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :recipes do
    resource :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
