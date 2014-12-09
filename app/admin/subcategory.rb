ActiveAdmin.register Subcategory do


form(:html => { :multipart => true }) do |f|
  f.inputs "Subcategory Details" do
    f.input :name
    f.input :description
    f.input :slug
    f.select :category_id, 
            options_for_select([*Category.all.map{ |c| [c.name, c.id] }])

    # f.input :hero_image, :required => false, :as => :file
    # # Will preview the image when the object is edited
  end
  f.actions
 end


controller do
  def find_resource
    scoped_collection.friendly.find(params[:id])
  end
end

permit_params :name, :description, :hero_image, :category_id

end
