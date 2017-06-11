Rails.application.routes.draw do
  resources :welcome, only: %i(index)
  resources :groups, only: %i(index show)
  resources :restrictions, only: %i(index)
  root to: 'welcome#index'
end
