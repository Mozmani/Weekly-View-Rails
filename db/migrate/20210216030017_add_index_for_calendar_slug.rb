class AddIndexForCalendarSlug < ActiveRecord::Migration[6.1]
  def change
    add_index :calendars, :slug, unique: true
  end
end
