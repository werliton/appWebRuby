class Room < ApplicationRecord

    validates_presence_of :title, :location, :description
    belongs_to :user
    has_many :reviews
    has_many :reviewed_rooms, :through => :reviews, :source => :room

    scope :most_recent, -> {
        order('created_at DESC')
    }

    def complete_name
        "#{title}, #{location}"
    end
end
