Rails.application.routes.draw do

  	resources :home do
		collection do
			get :about
			get :contactus
		end
	end

	resources :users do
		collection do
			get :index
			get :new
			post :create
			get :edit
			post :update
			get :delete
		end# collection
	end
	resources :tools do
		collection do
			get :index
			get :new
			post :create
			get :edit
			post :update
			get :delete
		end# collection
	end
	resources :experiences do
		collection do
			get :index
			get :new
			post :create
			get :edit
			post :update
			get :delete
		end# collection
	end
	
	resources :profiles do
		collection do
			get :index
			get :new
			post :create
			get :edit
			post :update
			get :delete
		end# collection
	end

	namespace :admin do
		resource :users do
			collection do
				get :index
				get :new
				post :create
				get :edit
				post :update
				get :delete

			end# collection
		end #users
	end #admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
