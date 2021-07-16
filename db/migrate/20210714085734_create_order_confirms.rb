class CreateOrderConfirms < ActiveRecord::Migration[6.0]
  def change
    create_table :order_confirms do |t|
      t.references :order,  null: false, foreign_key: true
      t.references :table,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
