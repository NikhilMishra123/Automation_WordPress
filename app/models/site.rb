class Site < ApplicationRecord
  belongs_to :user
	has_many :results

	def self.getSelectedSite(siteId)
		@site= Site.where(id: siteId)
		return @site[0]
	end
	
  def self.getAllSite(userId)
		@sites = Site.where(user: userId)
		return @sites
	end
end
