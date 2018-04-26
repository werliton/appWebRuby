class Room < ApplicationRecord
  validates_presence_of :title, :location, :description
end
