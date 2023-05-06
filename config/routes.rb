Rails.application.routes.draw do
  root 'homes#top'
  get 'about' => 'homes#about'
  devise_for :users
  resources :users, only:[:index, :show, :edit, :update]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :magazines do
      resources :comments, only:[:create, :destroy]
      resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
