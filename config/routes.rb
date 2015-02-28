Rails.application.routes.draw do

  get 'gallery' => 'gallery#index'

  get 'admin' => 'admin#index'

  scope 'admin' do
    resources :photos, :albums, :sections, :articles
  end

  root 'main#index'

end
