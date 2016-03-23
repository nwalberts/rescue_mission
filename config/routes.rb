Rails.application.routes.draw do

  root 'questions#index'

  resources :questions do
    resources :answers, only: [:index, :show, :new, :create, :destroy]
  end
end
