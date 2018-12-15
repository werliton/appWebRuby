class RoomPresenter
    delegate :user, :created_at, :description, :location, :title, :to => :@room

    def initialize(rooms, context, show_form=true)
        @context = context
        @room = room
        @show_form = show_form
    end

    def can_review?
        @context.user_signed_in?
    end

    def show_form?
        @show_form
    end

    def review
        @review ||= @room.reviews.
            find_or_initialize_by_user_id(@context.current_user.id)
    end

    def review_route
        [@room, review]
    end

    def route
        @room
    end

    def review_points
        Review::POINTS
    end

    def to_partial_path
        'room'
    end

    def stars
        @room.reviews.size
    end
end