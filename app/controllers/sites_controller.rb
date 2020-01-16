class SitesController < ApplicationController

	def index
    @sites = Sites.all
  end


  def show
    @site = Sites.find(params[:id])
  end

  def new
  end
=begin
		Error here  
=end 
  def ab
		debugger
    @sites  = Site.new(site_params)
    @sites.save
    redirect_to "/sites/#{@sites.id}"

  end

  private
    def site_params
      params.require(:site).permit(:siteURL,:user )
    end



end
