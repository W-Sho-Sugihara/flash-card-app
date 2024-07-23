class DecksTitleMustBeUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :decks, :title, :unique => true
  end
end
