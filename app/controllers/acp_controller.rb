class AcpController < ApplicationController
	check_authorization

	
	def index
		@user_count = User.count
		@trip_count = Trip.count
		authorize! :manage, @user_count, @trip_count
	end

	def users
		@users = User.all
		authorize! :manage, @users
	end

	def edit_user
		@user = User.find(params[:id])
		authorize! :manage, @user
	end

	def update_user
		@user = User.find(user_params[:id])
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to acp_users_path, notice: 'User was successfully updated.' }
				format.json { render :show, status: :ok, location: acp_users_path }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
		authorize! :manage, @user
	end

	def delete_user
		@user = User.find(params[:id])
		@user.destroy
		respond_to do |format|
				format.html { redirect_to acp_users_path, notice: 'User was successfully deleted.' }
				format.json { head :no_content }
		end
		authorize! :manage, @user
	end
	
	def trips
		@trips = Trip.all

		authorize! :manage, @trips
	end

	private

	def user_params
		params.require(:user).permit(:id,:email)
	end

end
