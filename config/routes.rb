Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    namespace :mobile do
      namespace :v1, defaults: { format: :json } do
        devise_scope :user do
          resource :users, only: :create, controller: 'users'
          resource :sessions, only: [:create, :destroy], controller: 'sessions'
        end
        resource :current_user, only: :show, controller: 'current_user'
        resource :current_kid, only: :update, controller: 'current_kid'
        resources :kids, only: [:create, :update, :destroy] do
          resources :diaper_events, only: [:create, :update], controller: 'kids/diaper_events'
          resources :events, only: :index, controller: 'kids/events'
        end
        resources :events, only: :delete
      end
    end
  end
end
