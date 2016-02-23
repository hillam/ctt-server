class AddPublicToSites < ActiveRecord::Migration
	def change
		add_column :sites, :public, :booleanm, default: false
	end
end
