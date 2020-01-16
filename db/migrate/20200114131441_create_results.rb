class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :testsuite, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.string :TestResult

      t.timestamps
    end
  end
end
