module ApplicationHelper
  


# Coutn unreaded messages for header
  def count
   current_user.mailbox.receipts.where({:is_read => false}).count(:id, :distinct => true).to_s
  end


  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
	def resource_class
	  devise_mapping.to
	end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


end