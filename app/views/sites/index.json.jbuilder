@sites.each do |site|
	json.set! site.hostname, site.time
end
