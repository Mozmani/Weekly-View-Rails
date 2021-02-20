class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|

      t.float :wake_hour
      t.float :sleep_hour
      t.string :slug
      
      #t.timestamps
    end
  end
end
