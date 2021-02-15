class AddUserToCalendar < ActiveRecord::Migration[6.1]
  def change
    add_reference :calendars, :user, null: false, foreign_key: true
  end
end
