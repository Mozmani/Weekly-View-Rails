class Calendar < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    #validates :calendar_name, presence: true 
    belongs_to :user, class_name: "User"
    has_many :tasks, foreign_key: :calendar_id
end
