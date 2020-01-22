class Testsuite < ApplicationRecord
	has_many :results, dependent: :destroy

	def self.getSelectedTests(test_ids)
		selected_tests = Array.new
		test_ids.each do |test_id| 
			@testsuite= Testsuite.where(id: test_id)
			selected_tests.push(@testsuite[0])
		end
		return selected_tests
	end

end
