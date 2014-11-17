class PagesController < ApplicationController
 
  def index
		@listings = Listing.where(:id => [1,2])
  end

  def about
  end

  def contact
  end
  
end
