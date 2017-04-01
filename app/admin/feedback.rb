ActiveAdmin.register Feedback do
form do |f|
	f.inputs do
		f.input :user_id
		f.input :photo_id
		f.input :desc
	end

	f.actions
end

permit_params :user_id, :photo_id, :desc

index do
	selectable_column
	id_column
	column :user_id  do |user|
		link_to feedback.user, admin_user_path(user)
	end
	column :photo_id do |photo|
		link_to feedback.photo, admin_photo_path(user)
	end
	column :desc
	actions
end

show do
	attributes_table do
		row :user_id  do |user|
		link_to feedback.user, admin_user_path(user)
	end
		row :photo_id do |photo|
		link_to feedback.photo, admin_photo_path(photo)
	end
		row :desc
	end
	active_admin_comments

end
		
end
