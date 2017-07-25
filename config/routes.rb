Rails.application.routes.draw do
  resources :wellist_vendors
  resources :wellist_vendors
  namespace :api, defaults: { format: 'json' } do
    resources :users, only: [:show, :update] do
      resource :wellist, only: [:update, :destroy], controller: 'wellist'
      get :wellist, to: 'wellist#show', controller: 'wellist'
    end
    resources :vendors, only: [:show, :create]
  end

  root to: redirect('/422.html')

  match '*unmatched', via: [:options],
                      to:  ->(_env) { [200, { 'Content-Type' => 'text/plain' }, ["OK\n"]] }
end
