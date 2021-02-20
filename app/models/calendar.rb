class Calendar < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    validates :name, presence: true 
    validates :user_id, presence: true
    belongs_to :user, class_name: "User"
    has_many :tasks, foreign_key: :calendar_id
end
