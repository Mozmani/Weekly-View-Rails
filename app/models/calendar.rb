class Calendar < ApplicationRecord
    validates :calendar_name, presence: true 
    belongs_to :user
end
