class Result < ApplicationRecord
  belongs_to :testsuite
  belongs_to :site

	#case -- if no previous testcase found :: not handled yet 
	def self.fetchPreviousResult(selected_site , selected_tests, test_ids)		
		prev_results =  { }
		 selected_tests.each do |test|
			@result = Result.where(site: selected_site, testsuite: test).order(:id ).last
			prev_results[test.id] = (@result != nil)? @result.TestResult : 'Not Found'
		end
		return prev_results
	end
	
	def self.save_result(selected_site, selected_tests, results)	
		selected_tests.each do |test|
			Result.create(
				:testsuite => test,
				:site => selected_site,
				:TestResult => results[test.TestName]
			);
			end
	end

end
