json.array!(@sites) do |site|
	json.id site.id
	json.hostname site.hostname
	json.time site.time
end
