Rails.application.routes.draw do

  root 'main#index'

  get 'news/index'
  get 'learn/index'
  get 'travel/index'
  get 'photo/index'

  get 'gallery' => 'gallery#index'
  get 'gallery?album=:id' => 'gallery#index'
  get 'album/:id' => 'albums#show'
  get 'admin' => 'admin#index'
  get 'articles/' => 'articles#all'
  get 'articles/:id' => 'articles#read'
  get 'gallery/' => 'gallery#index'
  get 'gallery/:album' => 'gallery#slideshow'


  scope 'admin' do
    resources :sections, :articles

    resources :albums do
      resources :photos
    end
  end

end
