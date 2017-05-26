class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string   :title
      t.integer  :user_id
      t.boolean  :current

      t.timestamps
    end
  end
end
