Rails.application.routes.draw do
  resources :events, only: :create, path: '/v1/events'
end
