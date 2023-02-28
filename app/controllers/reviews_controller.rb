class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end


  def create
    @review = Review.new(review_params)
    @user = Review.find(params[:user_id])
    @review.user = @user
    if @review.save
      redirect_to user_path
    else
      @review = Review.new
      render 'users/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(@review.user)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
