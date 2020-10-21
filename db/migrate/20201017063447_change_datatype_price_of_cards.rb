class ChangeDatatypePriceOfCards < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :price, :string
  end
end
