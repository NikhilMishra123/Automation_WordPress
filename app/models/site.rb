class Site < ApplicationRecord
  belongs_to :user
	has_many :results

	#nikhil for testing purpose  ::: remove 
	def self.save_result(user, test_id_to_name, site_URL)
      Site.create(
				:siteURL => 'http://127.0.0.1/',
        :user => user
			);
  end


	def self.getSelectedSite(site_id)
		@site= Site.select(:id , :siteURL).where( id: site_id)
		return @site[0]
	end

end
