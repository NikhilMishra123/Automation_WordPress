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
		  result_hash = JSON.parse(response.body);		
			return result_hash
		end


		 def self.getfinalResult(selected_tests, prev_results, results)
      @finalResult = Array.new
      selected_tests.each do|test|
				@finalResult.push([
													test.id,
													test.TestName,
													prev_results[test.id],
													results[test.TestName]
				])
      end
      return @finalResult
    end
=begin
		def self.getfinalResult(selected_tests, prev_results, results)
			length = selected_tests.length
			@finalResult = Array.new(length) { Array.new(4) }
			i=0
			selected_tests.each do|test|
				@finalResult[i][0]=test.id
        @finalResult[i][1]=test.TestName
        @finalResult[i][2]=prev_results[test.id]
        @finalResult[i][3]=results[test.TestName]
				i=i+1
			end
			return @finalResult
		end
=end

end
