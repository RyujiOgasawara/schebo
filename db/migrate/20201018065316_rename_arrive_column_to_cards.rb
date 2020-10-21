class RenameArriveColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :arrive, :arrive_date
  end
end
