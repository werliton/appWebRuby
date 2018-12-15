class Rooms::BaseController < ApplicationController
    before_action :require_authentication

    private

    def room
        @room ||= Room.find(params[:id])
    end
end

class Rooms::ReviewsController < Rooms::BaseController
    
    def create
        review = room.reviews.
        find_or_initialize_by_user_id(current_user.id)

        review.update_attributes!(params[:review])

        head :ok
    end

    def update 
        create
    end
end