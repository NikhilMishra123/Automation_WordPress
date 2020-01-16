class Testsuite < ApplicationRecord
	has_many :results, dependent: :destroy

	def self.getTestName(test_ids)
		test_names = Array.new
		for i in test_ids do 
			test_names = Testsuite.select(:TestName).where(id: i)
		end
		return test_names
	end


	def self.getTestHash(test_ids)
    hash_test = Hash[test_ids.map {|x| [x, nil]}]


    for i in test_ids do
      hash_test[i] = Testsuite.select(:TestName).where(id: i)
    end
    return hash_test

  end


end
