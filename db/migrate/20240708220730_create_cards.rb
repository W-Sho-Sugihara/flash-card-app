class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :question, null: false
      t.string :answer
      t.references :deck, null: false
      t.date :due_next, null: false, default: :today

      t.timestamps
    end
  end
end
