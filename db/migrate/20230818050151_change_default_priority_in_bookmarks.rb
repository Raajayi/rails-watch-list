class ChangeDefaultPriorityInBookmarks < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookmarks, :priority, 3
  end
end
