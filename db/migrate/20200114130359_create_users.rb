class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.text :password, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
