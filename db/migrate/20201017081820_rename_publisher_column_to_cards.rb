class RenamePublisherColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :publisher, :mobile
  end
end
