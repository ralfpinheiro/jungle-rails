class ReviewsController < ApplicationController


    def create
    current_user = User.find(session[:user_id]) if session[:user_id]
    product = Product.find params[:product_id]
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = product.id

    if @review.valid?
      @review.save
    end
      redirect_to product
 end

      private
    
      def review_params
        params.require(:review).permit(
          :rating,
          :description
        )
      end

end


