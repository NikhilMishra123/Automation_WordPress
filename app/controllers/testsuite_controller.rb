class TestsuiteController < ApplicationController

	def index
    @testsuites = Testsuite.all
  end
	
  def show
    @testsuite = Testsuite.find(params[:id])
  end

	def new
	end

	def save
		@testsuite = Testsuite.new(testsuite_params)
		@testsuite.save
		redirect_to "/testsuite/#{@testsuite.id}"
	end

	private
    def testsuite_params
      params.require(:testsuite).permit(:TestName , :address ,:cat)
    end

end
