Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  get 'posts/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "public/homes#top"
  get 'public/homes/about' => 'public/homes#about', as: 'about'
  
  # ユーザ用
  # URL /users/sign_in ...
  devise_for :users ,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index,:show,:edit,:update]
  end
  
  namespace :public do
    resources :users, only: [:show,:edit,:update]
    
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    
  end

end
