class AddErrorsCountToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :erros_count, :integer, default: 0
  end
end
