class SubcategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  

  def index
   
   @subcategories = Subcategory.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subcategories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @subcategory = Subcategory.friendly.find(params[:id])
    @listings = @subcategory.listings.all

    @parent = @subcategory.category
    @category = @subcategory.category_id
    @subcategories = Subcategory.where(category_id: @category)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subcategory }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @subcategory = Subcategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subcategory }
    end
  end

  # GET /categories/1/edit
  def edit
    @subcategory = Subcategory.friendly.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @subcategory = Subcategory.new(subcategory_params)

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to @subcategory, notice: 'Category was successfully created.' }
        format.json { render json: @subcategory, status: :created, location: @subcategory }
      else
        format.html { render action: "new" }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @subcategory = Subcategory.friendly.find(params[:id])

    respond_to do |format|
      if @subcategory.update_attributes(subcategory_params)
        format.html { redirect_to @subcategory, notice: 'Subcategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @subcategory = Subcategory.friendly.find(params[:id])
    @subcategory.destroy

    respond_to do |format|
      format.html { redirect_to subcategories_url }
      format.json { head :no_content }
    end
  end


  	private

	def subcategory_params
	  params.require(:subcategory).permit(:name, :description, :category_id, :hero_image )
	end

end