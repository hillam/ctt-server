class Site < ActiveRecord::Base
    has_many :entries, dependent: :destroy
    has_many :notifications, dependent: :destroy
    belongs_to :user

    validates_uniqueness_of :hostname, :scope => [:user_id]

	def time
		self.entries.forever
	end

	def belongs_to? user
		user ? user.sites.exists?(self.id) : false
	end

	def self.visible user
		result = where(public: true)
		result += where(user_id: user.id, public: false) if user
		result.sort{|a,b| b.time <=> a.time}
	end
end
