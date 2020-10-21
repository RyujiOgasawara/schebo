class RenameMemoColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :memo, :comment
  end
end
