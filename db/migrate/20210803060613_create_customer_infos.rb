class CreateCustomerInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_infos do |t|
      t.integer     :sex_id,  null: false
      t.integer     :age_id,  null: false
      t.references  :table,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
