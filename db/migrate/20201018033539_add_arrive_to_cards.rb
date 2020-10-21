class AddArriveToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :arrive, :datetime
  end
end
