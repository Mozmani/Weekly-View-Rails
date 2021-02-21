class Task < ApplicationRecord
  include ActiveModel::Validations
  validates_with TaskValidator

  belongs_to :calendar, class_name: "Calendar"
end
