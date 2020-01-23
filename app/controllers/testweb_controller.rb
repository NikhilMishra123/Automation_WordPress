class TestwebController < ApplicationController
	
	def new
		@sites = Site.where(user: "id")
		@tests = Testsuite.all
	end

	def run
		site_id =1
		test_ids=['6']
		debugger
		selected_site = Site.getSelectedSite(site_id)
		selected_tests = Testsuite.getSelectedTests(test_ids)
		results = ::RunProcess.executeTest(selected_site, selected_tests)
		previous_results = Result.fetchPreviousResult(selected_site, selected_tests,test_ids)
		Result.saveResults(selected_site,selected_tests,results)
		@finalResult = ::RunProcess.combineResults(selected_tests,previous_results,results)
		debugger
    redirect_to "/testweb/display"
	end
	
	def display
	end
end
