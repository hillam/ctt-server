require 'test_helper'

class SitesHelperTest < ActionView::TestCase
	test "format seconds" do
		assert_equal '1 minute', format_time(60)
		assert_equal '1 minute', format_time(61)
		assert_equal '3.4 minutes', format_time(204)
		assert_equal '3.4 minutes', format_time(205)
		assert_equal '3 hours', format_time(10800)
		assert_equal '3 hours', format_time(10801)
		assert_equal '1 day', format_time(86400)
		assert_equal '1 day', format_time(86402)
	end
end
