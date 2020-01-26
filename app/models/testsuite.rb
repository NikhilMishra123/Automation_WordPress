class Testsuite < ApplicationRecord
	has_many :results, dependent: :destroy
	API_URL  = 'http://127.0.0.1:8080'
	
	def self.getSelectedTests(testIds)
		selectedTests = Array.new
		testIds.each do |testId|
			@testsuite= Testsuite.where(id: testId)
			selectedTests.push(@testsuite[0])
		end
		return selectedTests
	end
	
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

end
