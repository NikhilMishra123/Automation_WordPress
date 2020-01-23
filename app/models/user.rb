class User < ApplicationRecord
	has_many :sites
	
	#nikhil for testing purpose  ::: remove 
	 def self.save_result(results, test_id_to_name, site_URL)
		 User.create(
			 :email => 'nikhil@gmail.com',
			 :password => 'nikhil'
		 );
  end

	#nikhil for testing purpose ::: remove	
	 def self.retriveUser()
		 return User.where( id: '1')
	 end

end
