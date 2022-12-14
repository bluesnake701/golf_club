class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|

      t.integer :menu_genre_id, null: false
    	t.string :name, null: false
    	t.text :introduction, null: false
    	t.integer :price, null: false
    	t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
