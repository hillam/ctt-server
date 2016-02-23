module SitesHelper
	def hours num
		if num < 3600
			(num / 3600.0).round(2)
		else
			num / 3600
		end
	end
end
