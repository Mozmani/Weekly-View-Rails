class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :calendar, index: true, foreign_key: {to_table: :calendars}
      t.string :desc
      t.float :start
      t.float :end
      t.integer :day
      t.string :text_color
      t.string :background_color

      t.timestamps
    end
  end
end
