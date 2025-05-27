class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :people_limit
      t.date :date
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
