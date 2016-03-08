class SitesController < ApplicationController
    before_filter :authorize, only: :update

    def index
		if params[:user_id]	# for profile
			user = User.find(params[:user_id])
			query = user.sites.visible(current_user)
			@sites = query.sort{|a,b| b.time <=> a.time}.to_a
		else 				# for API
			authorize
			@sites = current_user.sites.to_a
		end
    end

    def show
		@user = User.find(params[:user_id])
		@site = @user.sites.where(id: params[:id]).visible(current_user).first
		raise ActionController::RoutingError.new('Not Found') unless @site
    end

    def update
		#
		# This is way to bulky..
		# Trim this down.
		#
        params.require(:sites).each do |host, time|
            site = current_user.sites.find_by(hostname: host)
            if site.nil?
                site = Site.create(hostname: host, user_id: current_user.id)
			else # determine whether to notify
				site.notifications.each do |noti|
					# expired
					if noti.expired?
						noti.sent = Time.now.to_i
						noti.save
					# ready to send
					elsif site.entries.where('created_at > ?', Time.at(noti.sent)).sum(:time) > noti.time
						noti.sent = Time.now.to_i
						noti.save
						NotificationMailer.notify(noti, current_user.email).deliver_later
					end
				end
			end
            Entry.create(time: time, site_id: site.id)
		end
    end

	def update_public
		site = Site.find(params[:id])
		site.public = params[:public]
		site.save
	end

    private

    def authorize
        # raise 404 error if user is not logged in
        raise ActionController::RoutingError.new('Not Found') if current_user.nil?
    end
end
