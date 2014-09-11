class RatingsController < ApplicationController
	before_action	:set_rating, only: [:update]

	def show

	end

	def new
		@rating = Rating.new rating: 0, user:current_user, trip:Trip.find(params[:trip])

		respond_to do |format|
			format.html { redirect_to :back, notice: 'Trip was successfully bought.' } if @rating.save(validate:false)
			format.html { redirect_to :back, notice: "Trp couldn't be bought." }
		end
	end

#	def create
#		@rating = Rating.new
#
#		respond_to do |format|
#			if @rating.save(rating_params)
#				format.html { redirect_to root_path, notice: 'Rating was successfully saved.' }
#			#	format.json { render :show, status: :ok, location: root_path }
#		else
#			format.html { redirect_to root_path, notice: 'This Rating is not allowed.'  }
#			#	format.json { render json: @rating.errors, status: :unprocessable_entity }
#		end
#	end
#end

def update
	respond_to do |format|
		if @rating.update(rating_params)
			format.html { redirect_to root_path, notice: 'Rating was successfully updated.' }
			#	format.json { render :show, status: :ok, location: root_path }
		else
			format.html { redirect_to root_path, notice: 'This Rating is not allowed.'  }
			#	format.json { render json: @rating.errors, status: :unprocessable_entity }
		end
	end
end

private

def set_rating
	@rating = Rating.find(params[:rating][:id])
end

def rating_params
	params.require(:rating).permit(:rating, :id)
end
end
