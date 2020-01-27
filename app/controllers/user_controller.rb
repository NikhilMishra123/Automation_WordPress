class UserController < ApplicationController

	def index
		@users =User.all
	end 
	
	def signin
	end

	def login
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.userIsPresent(email, password) 
    if !@user
      render :action => "signin"
    else
			session[:current_user_id] = @user[0].id
      redirect_to :controller => 'sites', :action => 'index'
    end
  end
	
	private
    def userParams
      params.require(:user).permit(:email, :password)
    end

end
