class RunProcess < ApplicationRecord
		API_URL  = 'http://127.0.0.1:8080'

		def self.executeTest(selectedSite, selectedTests)
			testNames = Array.new  
			selectedTests.each do |test|
				testNames.push(test.TestName)
			end
			body = {
				"siteURL" => selectedSite.siteURL,
				"testSuites" => testNames
			}
			response = HTTParty.get(API_URL, :body => body)
		  results = JSON.parse(response.body);		
			return results
		end
		
		def self.combineResults(selectedTests, previousResults, results)
      @finalResult = Array.new
			debugger
      selectedTests.each do|test|
				@finalResult.push({
												:testName =>	test.TestName,
												:prevResult => 	previousResults[test.TestName],
												:result => 	results[test.TestName]
				})
      end
      return @finalResult
    end
end
