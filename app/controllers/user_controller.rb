class UserController < ApplicationController
	
	def new 
	end 
 
	def save
    @user = User.new(testsuite_params)
    @user.save
    redirect_to "/user/#{@user.id}"
  end

end
