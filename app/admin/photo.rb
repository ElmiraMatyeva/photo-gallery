ActiveAdmin.register Photo do

form do |f|
	f.inputs do 
		f.input :user
		f.input :title
		f.input :rating
		f.input :avatar, :as => :file, :hint => image_tag(f.object.avatar.url(:thumb))
	end
	f.actions	
end

permit_params :user_id, :title, :rating, :avatar

index do
	selectable_column
	id_column
	column :avatar do |photo|
		image_tag photo.avatar.url(:thumb)
	end

	column :title
	column :user do |photo|
		link_to photo.user, admin_user_path(user)
	end

	column :rating
	actions
end

show do
attributes_table do
	row :avatar do |photo|
		image_tag photo.avatar.url(:medium)
	end

	row :title
	row :user do |photo|
		link_to photo.user, admin_user_path(user)
	end

	row :rating
end

active_admin_comments
end

end
