class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end

  def show
  end

  def create
    @product = Product.find(params[:product_id])
    puts params[:product_id]

    # @review = Review.new(review_params)
    @review = current_user.reviews.build(review_params)
    if @review.save!
      flash[:success] = 'Review created!'
      redirect_to @product
    else
      redirect_to products_url
    end
  end

  def destroy
    @review = Review.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Review was successfully destoyed.' }
      format.json { head :no_content }
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :product_id)
  end

end
