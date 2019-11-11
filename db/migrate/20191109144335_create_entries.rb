class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.date :effective_date
      t.boolean :checked
      t.string :check_number
      t.string :comment
      t.float :value

      t.references :account, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :recurrent_entry, null: true

      t.timestamps
    end
  end
end
