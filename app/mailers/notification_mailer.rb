class NotificationMailer < ApplicationMailer
	def notify notification, email
		@notification = notification
		@site = Site.find(@notification.site_id)
		mail(to: email, subject: 'CTT Notification')
	end
end
