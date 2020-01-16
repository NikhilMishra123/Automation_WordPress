Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sites, :testsuite, :testweb
 
	root 'testsuite#index'

	post 'testsuite/ab', to: 'testsuite#ab'
	post 'sites/ab' , to: 'sites#ab'

end
