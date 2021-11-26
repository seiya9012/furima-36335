Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
    resources :items ,only:[:new,:edit,:update,:create,:show,:destroy]do
    resources :orders, only: [:index, :create]
    end

end
