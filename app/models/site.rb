class Site < ApplicationRecord
  belongs_to :user
	has_many :results

	def self.getSelectedSite(site_id)
		@site= Site.select(:id , :siteURL).where( id: site_id)
		return @site[0]
	end

end
