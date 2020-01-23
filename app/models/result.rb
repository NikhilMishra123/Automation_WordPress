class Result < ApplicationRecord
  belongs_to :testsuite
  belongs_to :site
 
	def self.fetchPreviousResult(selected_site , selected_tests, test_ids)		
		previous_results =  { }
		selected_tests.each do |test|
			@result = Result.select(:id, :TestResult).where(site: selected_site, testsuite: test).order(:id ).last
			previous_results[test.TestName] = (@result != nil)? @result.TestResult : 'Never Tested'
		end
		return previous_results
	end
	
	def self.saveResults(selected_site, selected_tests, results)	
		selected_tests.each do |test|
			Result.create(
				:testsuite => test,
				:site => selected_site,
				:TestResult => results[test.TestName]
			)
			end
	end

end
