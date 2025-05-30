class ReviewsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.event = @event
    @review.user = current_user

    if @review.save
      redirect_to @event, notice: "Review added!"
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
