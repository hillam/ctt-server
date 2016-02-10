class Notification < ActiveRecord::Base
	belongs_to :site

	def notify
		self.sent = Time.now.to_i
		NotificationMailer.notify(self).deliver_later
	end
end
