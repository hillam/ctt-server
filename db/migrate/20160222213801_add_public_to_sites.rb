class AddPublicToSites < ActiveRecord::Migration
	def change
		add_column :sites, :public, :boolean, default: false
	end
end
