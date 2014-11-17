class ProfilesController < ApplicationController

  
  def show
  	@user = User.find(params[:id])
  	@listings = @user.listings.all

  	if @user
  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  	
  end

  def edit
  end

end
