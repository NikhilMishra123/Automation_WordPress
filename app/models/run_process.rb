require 'httparty'
require 'json'


class RunProcess < ApplicationRecord
		API_URL  = 'http://127.0.0.1:8080'

		def self.executeTest(selected_site,selected_tests)
			regex_test_pattern="" 
			selected_tests.each do |test|
				regex_test_pattern.concat(test.TestName)
				regex_test_pattern.concat('|')
			end
			regex_test_pattern.concat('none')
			body = {
				"siteURL" => selected_site.siteURL,
				"testSuites" => regex_test_pattern
			}
			response = HTTParty.get( API_URL , :body => body )
		  results = JSON.parse(response.body);		
			return results
		end
		
		def self.combineResults(selected_tests, previous_results, results)
      @finalResult = Array.new
      selected_tests.each do|test|
				@finalResult.push([
													test.id,
													test.TestName,
													previous_results[test.TestName],
													results[test.TestName]
				])
      end
      return @finalResult
    end
end
