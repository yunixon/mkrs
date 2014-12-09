ActiveAdmin.register Category do

form(:html => { :multipart => true }) do |f|
  f.inputs "Category Details" do
    f.input :name
    f.input :description
    f.input :slug
    f.input :hero_image, :required => false, :as => :file
    # Will preview the image when the object is edited
  end
  f.actions
 end

controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end
end


permit_params :name, :description, :hero_image

end
