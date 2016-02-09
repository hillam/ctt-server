class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :time
      t.integer :sent
      t.integer :span
	  t.integer :site_id
    end
  end
end
