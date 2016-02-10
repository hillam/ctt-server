class SitesController < ApplicationController
    before_filter :authorize

    def index
        sites = {}
        user_sites = current_user.sites.to_a
        user_sites.each do |site|
            sites[site.hostname] = site.entries.sum(:time)
        end
        render json: sites
    end

    def show
    end

    def update
        params.require(:sites).each do |host, time|
            site = current_user.sites.find_by(hostname: host)
            if site.nil?
                site = Site.create(hostname: host, user_id: current_user.id)
			else # determine whether to notify
				notifications = site.notifications.where('sent + span < ?', Time.now.to_i)
				notifications.each do |noti|
					if site.entries.where('created_at > ?', Time.at(noti.sent))
						noti.notify
					end
				end
			end
            Entry.create(time: time, site_id: site.id)
        end
    end

    private

    def authorize
        # raise 404 error if user is not logged in
        raise ActionController::RoutingError.new('Not Found') if current_user.nil?
    end
end
