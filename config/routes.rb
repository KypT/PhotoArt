Rails.application.routes.draw do

  root 'main#index'

  get 'gallery' => 'gallery#index'

  get 'admin' => 'admin#index'

  scope 'admin' do
    resources :sections, :articles

    resources :albums do
      resources :photos
    end
  end

end
