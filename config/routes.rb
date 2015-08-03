Rails.application.routes.draw do
  root 'main#index'

  get 'about' => 'main#about'
  get 'photo/index'
  get 'album/:id' => 'albums#show'
  get 'admin' => 'admin#index'
  post 'send_email' => 'main#send_email'
  get 'sitemap' => 'main#sitemap'

  namespace :admin do
    resources :sections
    resources :albums do
      resources :photos
    end
  end

  resources :message, only: [:create, :destroy]
  resources :discussion, only: [:index]
  resources :gallery, only: [:index, :show]

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  mount Ckeditor::Engine => '/ckeditor'

  scope ':section/' do
    resources :articles, path: ''
  end
end
