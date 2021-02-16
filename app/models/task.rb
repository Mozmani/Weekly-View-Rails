class Task < ApplicationRecord
  belongs_to :calendar, class_name: "Calendar"
end
