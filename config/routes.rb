Rails.application.routes.draw do
  	devise_for :users
  	resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	#devise_scope :user do
  		#root to: "devise/sessions#new"
	#end
	resources :books do
		resources :reviews
		
	end	

  resources :conversations do
    resources :messages
  end

#redirect to page with books
  authenticated :user do
    root to: 'books#index', as: :authenticated_root
  end

#no books
#HOMEPAGE = LOGIN
devise_scope :user do
 root :to => 'devise/sessions#new'
end

end
