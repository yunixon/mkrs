class ListingsController < ApplicationController

  include ActionView::Helpers::NumberHelper

#  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [ :new,:create ,:edit, :update, :destroy]
#  before_filter :check_user, only: [:edit, :update, :destroy]

#  def seller 
#    @listings = Listing.where(user: params[:id]).order("created_at DESC")
# end



  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all.order("created_at DESC")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing  = Listing.friendly.find(params[:id])
    @photos = @listing.photos

    @subcategory = @listing.subcategory
    @category = @listing.category
    @listings = @category.listings.all.where.not(id: @listing.id).order("RANDOM()").limit(4)
    # @listings = Listing.all.order("created_at DESC")


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listing }
    end
  end

  # GET /listings/new
  # def new
  #   @listing = Listing.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @listing }
  #   end
  # end

  def new
    @listing = Listing.new
    @listing.token = @listing.generate_token
    @photo = @listing.photos.build
    @photos = []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listing }
    end
  end


  # GET /listings/1/edit
  def edit
    @listing = Listing.friendly.find(params[:id])
    @photosold = @listing.photos
    @photo = @listing.photos.build
    @photos = []

  end

  # POST /listings
  # POST /listings.json

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @photos = Photo.where(:listing_token => @listing.token)
    @listing.photos << @photos

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Gallery was successfully created.' }
        format.json { render json: @listing, status: :created, location: @listing }
      else
        format.html { render action: "new" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing  = Listing.friendly.find(params[:id])
        
    @photos = Photo.where(:listing_id => @listing.id)
    @listing.photos << @photos

    respond_to do |format|
      if @listing.save
        format.html { redirect_to :action => 'show', notice: 'Gallery was successfully created.' }
        format.json { render json: @listing, status: :created, location: @listing }
      else
        format.html { render action: "new" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
  
    @listing = Listing.friendly.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url }
      format.json { head :no_content }
    end
  end

  def remove_image
      @listing.remove_image!
      @user.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:token, :name, :description, :price, :image, :materials, :category_id, :subcategory_id, 

:dimentions, :state, :exchangeable)
    end

    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end

end