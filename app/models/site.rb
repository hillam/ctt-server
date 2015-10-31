class Site < ActiveRecord::Base
    has_many :entries, dependent: :destroy
    belongs_to :user
    
    validates_uniqueness_of :hostname, :scope => [:user_id]
end
