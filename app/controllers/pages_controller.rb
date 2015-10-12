class PagesController < ApplicationController
  def root
    if !user_signed_in? or current_member
      redirect_to new_feedback_response_path
    elsif current_leader
      redirect_to clubs_path
    end
  end
end
