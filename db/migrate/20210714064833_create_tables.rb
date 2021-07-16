class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.integer :table_num, null: false
      t.timestamps
    end
  end
end
