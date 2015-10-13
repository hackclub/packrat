class LeadersController < ApplicationController
  def destroy
    analytics.track_user_deletion
    Leader.find(params[:id]).destroy
    redirect_to root_path
  end
end
