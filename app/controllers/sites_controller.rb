class SitesController < ApplicationController
    skip_before_action :verify_authenticity_token
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
            end
            Entry.create(time: time, site_id: site.id)
        end
    end

    private

    def authorize
        !current_user.nil?
    end
end