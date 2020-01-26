Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sites, :testsuite, :testweb
 
	root 'testweb#run'
	
	get 'user/signin' , to: 'user#signin'
	post 'testsuite/save', to: 'testsuite#save'
	post 'sites/save' , to: 'sites#save'
	post 'testweb/run' , to: 'testweb#run'
	get 'testweb/display' , to: 'testweb#display'
	get 'testweb/failed' , to: 'testweb#failed'
	post 'user/login' , to: 'user#login'
end
