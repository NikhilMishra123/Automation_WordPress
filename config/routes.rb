Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sites, :testsuite
 
	root 'user#signin'

	get 'testweb/show' ,to: 'testweb#show'

	#get 'testweb/show' , to: 'testweb#show'

	get 'testweb/ab' , to: 'testweb#ab'

	get 'testweb/index' ,to: 'testweb#index'	
	get 'user/signin' , to: 'user#signin'
	post 'testsuite/save', to: 'testsuite#save'
	post 'sites/save' , to: 'sites#save'
	get 'testweb/run' , to: 'testweb#run'
	get 'testweb/display' , to: 'testweb#display'
	get 'testweb/failed' , to: 'testweb#failed'
	post 'user/login' , to: 'user#login'
end
