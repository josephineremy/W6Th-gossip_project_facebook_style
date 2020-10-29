Rails.application.routes.draw do
  resources :sessions, only:[:new, :create, :destroy]
  resources :welcome
  resources :user
  resources :gossips do
    resources :likeys
    resources :comments do
      resources :likes
    end
  end

  root 'gossips#index'
  get '/equipe', to: 'static_pages#equipe'
  get '/contact', to: 'static_pages#contact'
  get 'concept', to: 'static_pages#concept'
  get 'city/:id', to: 'city#show', as: 'city'
end
