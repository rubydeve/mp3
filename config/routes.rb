Rails.application.routes.draw do
  get 'profile/index'
  get 'profile/show'
  get 'profile/edit'
  get 'profile/update'
  get 'profile/delete'
  devise_for :profiles, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, controllers: { registrations: "registrations" }
  

    resources :songs do
    resources :likes, only: [:create, :destroy]
  end


    resources :profiles do

             resources :playlists, only: [:new, :create, :show, :edit, :update, :destroy]
             resources :likes, only: [:index]

          end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'online-registration', to: 'pages#online-registration'

  get 'thank-you', to: 'pages#thank-you'

  root 'songs#index'
end


