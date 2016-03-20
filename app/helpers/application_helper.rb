module ApplicationHelper
	def format_time num
		units = [
	        {
	            name:       "year",
	            seconds:    31536000.0
	        },
	        {
	            name:       "month",
	            seconds:    2592000.0
	        },
	        {
	            name:       "week",
	            seconds:    604800.0
	        },
	        {
	            name:       "day",
	            seconds:    86400.0
	        },
	        {
	            name:       "hour",
	            seconds:    3600.0
	        },
	        {
	            name:       "minute",
	            seconds:    60.0
	        },
	        {
	            name:       "second",
	            seconds:    1.0
	        }
	    ]

		# 0 if the numbers are equal, 1 otherwise
		is_equal = Proc.new do |num1, num2|
			# ~= Math.abs(Math.sign((num1/num2).toFixed(1) - 1));
			((('%.1f' % (num1 / num2)).to_f - 1) <=> 0).abs
		end

		# 0 if the first number is divisible by the second, 1 otherwise
		is_divisible = Proc.new do |num1, num2|
			# ~=Math.abs(Math.sign((num1/num2).toFixed(1) % 1));
			((('%.1f' % (num1 / num2)).to_f % 1) <=> 0).abs
		end

		units.each do |unit|
			if num >= unit[:seconds]
				dec_format 	= ('%.' + (is_divisible.call(num, unit[:seconds])).to_s + 'f') % (num / unit[:seconds])
				s 			= 's' * is_equal.call(num, unit[:seconds]) # 's' or ''
				return dec_format + " " + unit[:name] + s
			end
		end
		0 # otherwise 'units' gets returned
	end
end
