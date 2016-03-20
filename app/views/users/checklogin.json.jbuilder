if @current_user
	json.login true
	json.id @current_user.id
	json.email @current_user.email
else
	json.login false
end
