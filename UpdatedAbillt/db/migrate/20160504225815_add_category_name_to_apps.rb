class AddCategoryNameToApps < ActiveRecord::Migration
  def change
    add_column :apps, :category, :string
  end
end
