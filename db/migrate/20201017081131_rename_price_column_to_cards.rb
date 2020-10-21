class RenamePriceColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :price, :sort_key
  end
end
