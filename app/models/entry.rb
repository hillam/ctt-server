class Entry < ActiveRecord::Base
    belongs_to :site

	def self.today
		where('created_at >= ?', 1.day.ago).sum(:time)
	end

	def self.week
		where('created_at >= ?', 1.week.ago).sum(:time)
	end

	def self.month
		where('created_at >= ?', 1.month.ago).sum(:time)
	end

	def self.year
		where('created_at >= ?', 1.month.ago).sum(:time)
	end

	def self.forever
		all.sum(:time)
	end
end
