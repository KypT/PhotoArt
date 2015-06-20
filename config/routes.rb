Rails.application.routes.draw do

  root 'main#index'

  get 'about' => 'main#about'
  get 'photo/index'
  get 'gallery' => 'gallery#index'
  get 'gallery?album=:id' => 'gallery#index'
  get 'album/:id' => 'albums#show'
  get 'admin' => 'admin#index'
  get 'articles/' => 'articles#all'
  get 'articles/:id' => 'articles#read'
  get 'gallery/' => 'gallery#index'
  get 'gallery/:album' => 'gallery#slideshow'
  post 'send_email' => 'main#send_email'
  get 'sitemap' => 'main#sitemap'

  namespace :admin do
    resources :articles, :sections
    resources :albums do
      resources :photos
    end
  end

  scope ':section/' do
    resources :events
  end

  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
end
