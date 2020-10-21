class RenameTitleColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :title, :name
  end
end
