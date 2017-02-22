class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    if current_user.has_reviewed? @restaurant
      flash[:notice] = 'You have already reviewed this restaurant!'
      redirect_to restaurants_path
    else
      @review = Review.new
      render 'new'
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    review = @restaurant.reviews.new(review_params)
    review.user = current_user
    review.save
    redirect_to restaurants_path
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
