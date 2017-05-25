class AddImgToCards < ActiveRecord::Migration[5.0]
  def up
    add_attachment :cards, :cardimg
  end

  def down
    remove_attachment :cards, :cardimg
  end
end
