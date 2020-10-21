class RenameAuthorColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :author, :destination
  end
end
