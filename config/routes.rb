Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    namespace :mobile do
      namespace :v1, defaults: { format: :json } do
        devise_scope :user do
          resource :users, only: :create, controller: 'users'
          resource :sessions, only: [:create, :destroy], controller: 'sessions'
        end
      end
    end
  end
end
