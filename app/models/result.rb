class Result < ApplicationRecord
  belongs_to :testsuite
  belongs_to :site

	def self.fetchPreviousResult(selectedSite , selectedTests, testIds)		
		previousResults =  { }
		selectedTests.each do |test|
			@result = Result.where(site: selectedSite, testsuite: test).order(:id ).last
			previousResults[test.TestName] = (@result != nil)? @result.TestResult : 'Never Tested'
		end
		return previousResults
	end
	
	def self.saveResults(site, tests, results)	
		tests.each do |test|
			Result.create(
				:testsuite => test,
				:site => site,
				:TestResult => results[test.TestName]
			)
			end
	end

	def self.combineResults(selectedTests, previousResults, results)
      @finalResult = Array.new
      selectedTests.each do|test|
        @finalResult.push({
                        :testName =>  test.TestName,
                        :prevResult =>  previousResults[test.TestName],
                        :result =>  results[test.TestName]
        })
      end
      return @finalResult
    end

end
