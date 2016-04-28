class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.string :link
      t.string :developer
      t.string :operation
      t.string :price

      t.timestamps null: false
    end
  end
end
