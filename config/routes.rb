Rails.application.routes.draw do
  root 'homes#top'
  get 'about' => 'homes#about'
  devise_for :users
  resources :users, only:[:index, :show, :edit, :update]
  resources :magazines do
      resources :comments, only:[:create, :destroy]
      resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
