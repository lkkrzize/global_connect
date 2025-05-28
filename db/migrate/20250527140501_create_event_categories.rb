class CreateEventCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :event_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
