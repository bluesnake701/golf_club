class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|

      t.integer :hole, null: false
    	t.string :par, null: false
    	t.string :yard, null: false
    	t.text :introduction, null: false

      t.timestamps
    end
  end
end
