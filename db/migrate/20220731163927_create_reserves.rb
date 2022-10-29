class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|

      t.integer :customer_id, null: false
      t.integer :plan_id, null: false
      t.integer :reserves_status, null: false, default: 0
      t.datetime :start
      t.timestamps
    end
  end
end
