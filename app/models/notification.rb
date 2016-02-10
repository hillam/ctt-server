class Notification < ActiveRecord::Base
	belongs_to :site

	# def notify email
	# 	self.sent = Time.now.to_i
	# 	NotificationMailer.notify(self, email).deliver_later
	# end

	def expired?
		self.sent + self.span > Time.now.to_i
	end
end
