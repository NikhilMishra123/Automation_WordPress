class CreateTestsuites < ActiveRecord::Migration[6.0]
  def change
    create_table :testsuites do |t|
      t.string :TestName, null: false, index: { unique: true }
      t.string :address
      t.string :type

      t.timestamps
    end
  end
end
