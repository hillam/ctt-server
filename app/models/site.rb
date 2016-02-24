class Site < ActiveRecord::Base
    has_many :entries, dependent: :destroy
    has_many :notifications, dependent: :destroy
    belongs_to :user

    validates_uniqueness_of :hostname, :scope => [:user_id]

	def time
		self.entries.sum(:time)
	end

	def belongs_to? user
		user ? user.sites.exists?(self.id) : false
	end

	def self.visible user
		result = where(public: true)
		result += where(user_id: user.id) if user
		result
	end
end
