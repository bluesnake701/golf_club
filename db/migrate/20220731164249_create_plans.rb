class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|

			t.string :plan_name, null: false
			t.string :player, null: false
			t.integer :round, null: false, default: 0
			t.integer :lunch, null: false, default: 0
			t.integer :cart, null: false, default: 0
			t.integer :caddy, null: false, default: 0
			t.integer :lodging, null: false, default: 0
			t.string :price, null: false

      t.timestamps
    end
  end
end
