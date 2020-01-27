class SitesController < ApplicationController

	def index
    @sites = Site.getAllSite(session[:current_user_id])
  end

  def show
		begin
				@sites = Site.find(params[:id])
			rescue StandardError => e
				render :action => "new"
		end
  end

  def new
  end

  def save
    site = siteParams
		userId  = User.getUser(session[:current_user_id])
		if userId ==  nil
			render "/sites/new"
		else
			@sites =	Site.create(
				:siteURL => site["siteURL"],
				:user =>  userId
			)
			redirect_to "/sites/#{@sites.id}"
		end
	end

  private
    def siteParams
      params.require(:site).permit(:siteURL,:user )
    end

end
