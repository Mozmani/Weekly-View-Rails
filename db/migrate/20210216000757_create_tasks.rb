class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :calendar, index: true, foreign_key: {to_table: :calendars}
      t.string :desc
      t.integer :start
      t.integer :end
      t.interger :day

      t.timestamps
    end
  end
end
