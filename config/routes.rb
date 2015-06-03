Rails.application.routes.draw do

  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  root 'main#index'

  get '/travel' => 'main#travel'
  get '/about' => 'main#about'
  get '/learn' => 'main#learn'
  get '/photo' => 'main#photo'
  get 'photo/index'

  get 'gallery' => 'gallery#index'
  get 'gallery?album=:id' => 'gallery#index'
  get 'album/:id' => 'albums#show'
  get 'admin' => 'admin#index'
  get 'articles/' => 'articles#all'
  get 'articles/:id' => 'articles#read'
  get 'gallery/' => 'gallery#index'
  get 'gallery/:album' => 'gallery#slideshow'

  namespace :admin do
    resources :articles, :sections
    resources :albums do
      resources :photos
    end
  end

end
