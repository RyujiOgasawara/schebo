class ChangeDatetypeArriveOfCards < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :arrive, :date
  end
end
