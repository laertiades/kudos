Rails.application.routes.draw do

  get 'users/show'

  root 'static_pages#index'

  resources :merits, only: [] do
    get :new, on: :member
    post :create, on: :member
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
