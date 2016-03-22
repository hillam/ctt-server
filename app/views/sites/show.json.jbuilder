if @site
	json.id @site.id
	json.hostname @site.hostname
	json.today @site.entries.today
	json.week @site.entries.week
	json.month @site.entries.month
	json.year @site.entries.year
	json.forever @site.entries.forever
else
	json.failure 'Either the site does not exist, or you do not have permission to view it.'
end
