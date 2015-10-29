class PagesController < ApplicationController
  def root
    if current_leader
      return redirect_to clubs_path
    end

    if current_admin
      return redirect_to admin_clubs_path
    end

    redirect_to new_feedback_response_path
  end
end
