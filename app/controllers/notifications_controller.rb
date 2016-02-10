class NotificationsController < ApplicationController
	before_filter :authorize

	# create a new notification
	def create
		site = Site.find_by(hostname: params[:hostname], user_id: current_user.id)
		data = params.permit(:time, :sent, :span)
		data[:site_id] = site.id
		data[:sent] = Time.now.to_i
		Notification.create(data)
	end

	# return all notifications
	def index
		@notifications = Notification.all
		render json: @notifications
	end

	# delete a notification
	def destroy
	end

	private

	def authorize
        # raise 404 error if user is not logged in
        raise ActionController::RoutingError.new('Not Found') if current_user.nil?
    end
end
