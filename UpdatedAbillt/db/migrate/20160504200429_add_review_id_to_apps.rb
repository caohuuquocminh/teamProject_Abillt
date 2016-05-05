class AddReviewIdToApps < ActiveRecord::Migration
  def change
    add_column :apps, :review_id, :integer
  end
end
