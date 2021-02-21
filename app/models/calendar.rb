class Calendar < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    validates :name, presence: true 
    validates :wake_hour, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 23.5}
    validates :sleep_hour, presence: true, numericality: {greater_than: :wake_hour, less_than_or_equal_to: 23.5}

    belongs_to :user, class_name: "User"
    has_many :tasks, foreign_key: :calendar_id
end
