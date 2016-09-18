Rails.application.routes.draw do
  resources :widgets
  resources :events, only: [:index, :create] 
  get 'events/query/org/:orgname(/host/:hostname)', to: 'events#query', as: :events_query
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace :api, contraints: { format: 'json'} do
		namespace :v1 do
			get 'events/query/org/:orgname(/host/:hostname)', to: 'events#query', as: :events_query
			#resources :events,  only: [:create]
  					

			#end
			#resources :events, only: [:create] do
			#	collection do
			#		#get 'query/:org', to: :query, as: :query
			#	end
			#end

			#resources :events, :only => [:index, :create] do
  			#		#get :me, on: :collection
			#end
			resources :events, only: [:index, :create] do
			end	
		end
	end

end
