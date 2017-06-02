class AddCheckCountToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :check_count, :integer, default: 0
  end
end
