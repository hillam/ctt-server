class NotificationMailer < ApplicationMailer
	def notify notification
		@site = Site.find(notification.site_id)
		mail(to: current_user.email, subject: 'CTT Notification')
	end
end
