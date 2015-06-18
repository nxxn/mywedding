Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", :locale => /en|ru|lv/ do

    devise_for :users

    namespace :admin do
      root :to => "articles#index"

      get 'tags/:tag', to: 'articles#index', as: :tag

      resources :articles
    end

  end

end
