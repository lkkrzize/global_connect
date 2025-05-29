class ReviewsController < ApplicationController

  def create
    Event.create(par)
  end


  private

  def review_params
     current_user
    params.require(:review).permit(:rating, :comment )
  end
end
