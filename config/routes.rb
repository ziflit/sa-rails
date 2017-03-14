Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :users do
      collection do
        mount Authentication::Engine => '/'
      end
      member do
        resources :rents, only: [:index, :create]
      end
    end

    resources :books, only: [:show, :index]
  end
end
