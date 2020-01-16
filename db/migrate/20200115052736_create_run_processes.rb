class CreateRunProcesses < ActiveRecord::Migration[6.0]
  def change
    create_table :run_processes do |t|

      t.timestamps
    end
  end
end
