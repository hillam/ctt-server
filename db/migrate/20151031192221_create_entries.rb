class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :time

      t.timestamps null: false
    end
  end
end
