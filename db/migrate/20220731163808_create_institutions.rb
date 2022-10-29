class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|

      t.string :name, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
