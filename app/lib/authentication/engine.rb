module Authentication
  class Engine < ::Rails::Engine
    isolate_namespace Authentication
  end

  # move this to config/routes.rb
  Engine.routes.draw do
    resources :sessions, only: [:create] do
      collection do
        post :renew
        post :invalidate_all
      end
    end
  end
end
