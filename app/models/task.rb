class Task < ApplicationRecord
  include ActiveModel::Validations
  validates_with TaskValidator, on: :create

  belongs_to :calendar, class_name: "Calendar"
end
