class Adapters::OnlyAdmins < Activeadmin::AuthorizationAdapter
	def authorized?(action, subject = nil)
		user.admin?
	end
end