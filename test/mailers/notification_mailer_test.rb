require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
	test "successful notify" do
		email = NotificationMailer.notify(notifications(:one), "hillam.mail@gmail.com").deliver_now

		assert_not ActionMailer::Base.deliveries.empty?
		assert_equal ['ctt.notifier@gmail.com'], email.from
		assert_equal ['hillam.mail@gmail.com'], email.to
	end
end
