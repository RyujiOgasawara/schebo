class ChangeDatatypeArriveOfCards < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :arrive, :datetime
  end
end
