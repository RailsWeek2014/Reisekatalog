class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :tag_cloud, only: [:tagged, :tagged_index]
  #load_and_authorize_resource
  authorize_resource
  respond_to :html


  def tagged_index
  end

  def tagged
    #Post.metasearch({:title_or_tag_taggings_tag_name_contains => params[:search]})
    #@q = Trip.search({:land_or_region_or_hotel_or_infos_or_tag_taggings_tag_name_cont => params[:q]})
    #@q = Trip.search({params[:tags] => params[:q]})

    #@trips = @q.result
    @trips = Trip.tagged_with(params[:id])
    #render partial: 'index_list'

    authorize! :tagged , @trips if params[:user]
  end

  # GET /trips
  # GET /trips.json
  def index

    @q = Trip.search(params[:q])
    @trips = @q.result

  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    if user_signed_in?
      @rating = Rating.find_by user_id: current_user.id , trip_id: @trip.id
      #render 'ratings/show' 
    else
      # ???
      @rating = Rating.new
    end
  end

  def my_trips
    @trips = Trip.where(id:Rating.includes(:trip).where(user_id:current_user.id).map(&:trip_id))
    authorize! :my_trips , @trips
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit

  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    @trip.tag_list.add( trip_params[:land],trip_params[:region],trip_params[:hotel])

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_rating
    respond_to do |format|
      if @rating.update(trip_params)
        format.html { redirect_to @trip, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
    authorize! :update_rating, @rating
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
      @rating = Rating.find_by user_id: current_user.id , trip_id: @trip.id if user_signed_in?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:land, :region, :hotel, :infos, :preis, :rating, :tag_list)
    end

    def tag_cloud
      #authorize! :tag_cloud , @tags

      @tags = Trip.tag_counts_on(:tags)
    #debug @tags
  end
end
