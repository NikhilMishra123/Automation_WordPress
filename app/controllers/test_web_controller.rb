class TestWebController < ApplicationController
	
	def new
		@sites = Site.where(user: "id")
		@tests = Testsuite.all
	end

	def run
	
		# check is it right way 
		tests_ids = @params[:query][:testId]
		site_URL = @params[:query][:siteURL]
	

		test_names = Testsuite.getTestName(test_ids)
		results = RunProcess.executeTest(site_URL,test_names)
		prev_result = Result.fetchPreviousResult(test_ids , site_URL)
		test_id_to_name = Testsuite.getTestHash(test_ids)
		Result.save_result(results, test_id_to_name, site_URL)
		@finalResult =  RunProcess.getfinalResult(results,prev_result,test_id_to_name)
    redirect_to "/testWeb/"
		#edit path for display action 

	end
	
	def display
		# use finalResult and display all results 
	end
end
