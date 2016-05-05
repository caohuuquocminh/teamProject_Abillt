class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.integer :app_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
