Rails.application.routes.draw do
  root "rooms#index"

  controller :sessions do
    get    "sign_in"  => :new
    post   "sign_in"  => :create
    delete "sign_out" => :destroy
  end

  resources :users
  resources :rooms do
    resource :room_users, only: [:create, :destroy]
    resources :messages, only: :create
  end
end
