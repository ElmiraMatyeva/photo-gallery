ActiveAdmin.register User do
form do |f|
	f.inputs do
		f.input :name
	end
	f.actions
end

permit_params :name

index do
	selectable_column
	id_column

	column :name do |user|
		link_to user, admin_user_path(user)
	end

actions
end

show do
attributes_table do 
	row :name |user|
		link_to user, admin_user_path(user)
	end

active_admin_products 	
end

end
