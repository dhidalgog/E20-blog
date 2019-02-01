Rails.application.routes.draw do
	
	get 'dashboard', to: "pages#index"
	patch 'dashboard/:user_id', to: "pages#change_role", as: :role

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
