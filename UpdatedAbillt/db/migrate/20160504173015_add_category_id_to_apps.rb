class AddCategoryIdToApps < ActiveRecord::Migration
  def change
    add_column :apps, :category_id, :integer
  end
end
