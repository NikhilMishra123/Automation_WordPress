class TestwebController < ApplicationController
	
	def new
		@sites = Site.where(user: "id")
		@tests = Testsuite.all
	end

	def run
		debugger
		# check is it right way 
		#tests_ids = @params[:query].except(:testId)
		#site_URL = @params[:query].except(:siteURL)
		site_URL = "http://127.0.0.1/"
		# 6 for hello test  
		test_ids= ['1']
		debugger
		selected_site= Site.getSelectedSite(1)
		debugger
		selected_tests  = Testsuite.getSelectedTests(test_ids)
		debugger
		results = ::RunProcess.executeTest(selected_site, selected_tests)
		debugger
		prev_results = Result.fetchPreviousResult(selected_site, selected_tests,test_ids)
		debugger
		Result.save_result(selected_site,selected_tests,results)
		debugger
		@finalResult = ::RunProcess.getfinalResult(selected_tests,prev_results,results)
		
		debugger

    redirect_to "/testweb/display"
	end
	
	def display
		# use finalResult and display all results 
	end
end
