class PhotosController < ApplicationController
# truncated for brevity.

  # GET /photos
  # GET /photos.json
  def index

    @listing = Listing.find(params[:listing_id])

    @photos = @listing.photos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @Listing = Listing.find(params[:listing_id])
    @photos = @listing.pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /pictures/1/edit
  def edit
    #@gallery = Gallery.find(params[:gallery_id])

    @photo = Photo.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @photo = Photo.new(params[:photo])
    @photo.user_id = current_user.id

    if @photo.save
      respond_to do |format|
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@photo.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    @gallery = Gallery.find(params[:gallery_id])

    @picture = @gallery.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(picture_params)
        format.html { redirect_to gallery_path(@gallery), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    #@gallery = Gallery.find(params[:gallery_id])
    #@picture = @gallery.pictures.find(params[:id])
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def make_default
    @photo = Photo.find(params[:id])
    @listing = Listing.find(params[:listing_id])

    @listing.cover = @listing.id
    @listing.save

    respond_to do |format|
      format.js
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :listing_id, :image)
  end








end