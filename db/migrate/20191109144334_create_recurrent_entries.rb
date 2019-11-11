class CreateRecurrentEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :recurrent_entries do |t|
      t.boolean :active
      t.boolean :checked
      t.string :comment
      t.float :value
      t.string :frequency
      t.date :start_date
      t.date :end_date

      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
