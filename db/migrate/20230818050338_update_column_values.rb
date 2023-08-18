class UpdateColumnValues < ActiveRecord::Migration[7.0]
  def change
    Bookmark.update_all(priority: 3)
  end
end
