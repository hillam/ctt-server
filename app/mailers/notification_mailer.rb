class NotificationMailer < ApplicationMailer
	def notify notification, email
		ActionMailer::Base.delivery_method = :smtp
		@notification = notification
		@site = Site.find(@notification.site_id)
		mail(to: email, subject: 'CTT Notification')
	end
end
