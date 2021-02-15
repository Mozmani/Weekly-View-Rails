class AddNameToCalendar < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :calendar_name, :string
  end
end
