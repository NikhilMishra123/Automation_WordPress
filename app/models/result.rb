class Result < ApplicationRecord
  belongs_to :testsuite
  belongs_to :site

	def self.fetchPreviousResult(test_ids , site_URL)
		
		prev_result = Hash[test_ids.map {|x| [x, nil]}]
		for i in test_ids do
			prev_result[i]= select( :TestResult ).where(site: site_URL ,testsuite: i).order(:id ).last
		end
		return prev_result
	end
	i
	def self.save_result(results, test_id_to_name, site_URL)
			test_id_to_name.each do |key, value|
				Result.create(
						testsuite: key,
						site: site_URL,
						TestResult: value
				);
			end
	end

	#	https://apidock.com/rails/ActiveRecord/Base/create/class
end
