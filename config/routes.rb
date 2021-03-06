Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    resources :purchases, only: [:create, :show]
    resources :users, only: [:show]
  end

end
