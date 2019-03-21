class ReviewsController < ApplicationController
	before_action :find_book
	before_action :find_review, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]


	def index	#I just added this
		@reviews = Review.all
		#@book.reviews = Review.paginate(:page => params[:page], per_page: 2)
	end

	def show
		 @review = Review.find(params[:id])
	end

	def new
		@review = Review.new
	end

	def create
		@reviews = Review.all
		@review = Review.create(review_params)


		@review = Review.new(review_params)
		@review.book_id = @book.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to book_path(@book)
		else
			render 'new'
		end		
	end

	def edit
		@review = Review.find(params[:id]) #for ajax modal
	end

	def update

		@reviews = Review.all
		@review = Review.find(params[:id])

		@review.update_attributes(review_params)

			if @review.update(review_params)
				redirect_to book_path(@book)
			else
				render 'edit'
			end		
	end



	def destroy
		#@reviews = Review.all
    	#@review = Review.find(params[:id])
		@review.destroy
		#redirect_to book_path(@book)
			respond_to do |format|
		  		format.js
	      		format.html { redirect_to :back , notice: 'Review was successfully destroyed.' }
	      		format.json { head :no_content }
	    	end
		

	end	

	private

		def set_review
	      @review = Review.find(params[:id])
	    end

		def review_params
			params.require(:review).permit(:rating, :comment)
		end	

		def find_book
			@book = Book.find(params[:book_id])
		end	

		def find_review
			@review = Review.find(params[:id])
		end	

end
