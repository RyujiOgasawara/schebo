class AddScheduleToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :schedule, :integer
  end
end
