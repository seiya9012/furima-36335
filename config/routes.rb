Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
    resources :items ,only:[:new,:edit,:update,:create,:show]do
    end

end
