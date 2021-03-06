Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'authorizations' }
  devise_scope :user do
    delete 'sign_out' => 'devise/sessions#destroy'
  end
  root to: 'posts#index'
  resources :posts, path: 'p' do
    resources :comments, only: [:create]
  end

  get 'rss' => 'posts#rss'
end
