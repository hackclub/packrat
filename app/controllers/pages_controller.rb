class PagesController < ApplicationController
  def root
    if current_leader
      redirect_to clubs_path
    end

    redirect_to new_feedback_response_path
  end
end
