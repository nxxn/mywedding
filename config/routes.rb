Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", :locale => /en|ru|lv/ do

    root to: "home#index"

    devise_for :users

    resources :articles

    get 'tags/:tag', to: 'articles#index', as: :tag

    namespace :admin do
      root to: "articles#index"

      resources :articles

      get 'tags/:tag', to: 'articles#index', as: :tag
    end

  end

end
