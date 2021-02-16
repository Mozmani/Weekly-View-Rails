class AddNameToCalendar < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :name, :string
  end
end
