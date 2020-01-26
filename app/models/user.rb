class User < ApplicationRecord
	has_many :sites

	def self.getUser(userId)
		@user = User.where(id: userId)
		return @user[0]
	end

	def self.userIsPresent(email, password)
		@user = User.where(email: email, password: password)
		@user = (@user[0]==nil) ? (false) : @user 
		return @user
	end 
end
