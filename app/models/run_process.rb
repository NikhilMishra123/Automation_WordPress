require 'httparty'
require 'json'

class RunProcess < ApplicationRecord

		def self.executeTest(siteURL,testNames)

			API_URL  = 'http://127.0.0.1:80'
			response = HTTParty.post(API_URL ,
															 :body {
																				:siteURL => siteURL ,
																				:testSuites => testNames 
																			}.to_json		)

		  result_hash = JSON.parse(response);
			return result_hash
		end

		def self.getfinalResult(results,prev_result,test_id_to_name)
			len = test_id_to_name.size
			@finalResult = Array.new(len) { Array.new(4) }
			i=0
			for test_id_to_name.each do|key, value|
				@finalresult[i][0]=key
        @finalresult[i][1]=value
        @finalresult[i][2]=prev_result[key]
        @finalresult[i][3]=results[value]
				i=i+1
			end
			return @finalResult
		end

end
