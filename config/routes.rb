Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  scope "(:locale)", :locale => /en|ru|lv/ do

    devise_for :users

    namespace :admin do
      root :to => "articles#index"

      resources :articles
    end

  end

end
