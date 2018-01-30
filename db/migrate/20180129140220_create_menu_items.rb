class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :meal
      t.integer :cost

      t.timestamps
    end
  end
end
