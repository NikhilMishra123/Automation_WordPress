class ChangeTestsuite < ActiveRecord::Migration[6.0]
  def change
		rename_column :testsuites, :type, :cat
	end
end
