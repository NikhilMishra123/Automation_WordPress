class TestwebController < ApplicationController
	
	def index
		@sites = Site.getAllSite(session[:current_user_id])
		@tests = Testsuite.all
	end

	def show
    @finalResult = params["finalResult"]
  end

	def run
		siteId = params[:site_id]
		testIds = params[:test_ids]
		if(testIds==nil or siteId==nil)
			redirect_to "/testweb/index"
		else
			selectedSite = Site.getSelectedSite(siteId)
			selectedTests = Testsuite.getSelectedTests(testIds) 
			results = Testsuite.executeTest(selectedSite, selectedTests)
			previousResults = Result.fetchPreviousResult(selectedSite, selectedTests, testIds)
			Result.saveResults(selectedSite, selectedTests, results)
			@finalResult = Result.combineResults(selectedTests, previousResults, results)
			redirect_to :action => "show", :finalResult => @finalResult
		end
	end
	
end
