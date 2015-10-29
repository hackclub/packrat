class MembersController < ApplicationController
  def destroy
    analytics.track_user_deletion
    Member.find(params[:id]).destroy
    redirect_to root_path
  end
end
