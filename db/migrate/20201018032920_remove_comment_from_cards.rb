class RemoveCommentFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :comment, :text
  end
end
