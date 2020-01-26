class TestwebController < ApplicationController
	
	def index
		@sites = Site.where(user: "id")
		@tests = Testsuite.all
	end

	def run
		siteId =1
		testIds=Array.new
		testIds.push(6)
		if(! testIds.any?)
			debugger
			redirect_to "/testweb/index"
		else
			debugger
			selectedSite = Site.getSelectedSite(siteId)
			selectedTests = Testsuite.getSelectedTests(testIds) 
			results = Testsuite.executeTest(selectedSite, selectedTests)
			previousResults = Result.fetchPreviousResult(selectedSite, selectedTests,testIds)
			Result.saveResults(selectedSite,selectedTests,results)
			@finalResult = Result.combineResults(selectedTests,previousResults,results)
			debugger
    	redirect_to "/testweb/display"
		end
	end
	
	def display
	end
end
