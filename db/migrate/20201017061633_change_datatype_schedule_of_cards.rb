class ChangeDatatypeScheduleOfCards < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :schedule, :string
  end
end
