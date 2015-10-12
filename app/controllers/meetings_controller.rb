class MeetingsController < ApplicationController
  before_action :authenticate_leader!

  def show
    @meeting = Meeting.find(params[:id])
    @feedback_responses = @meeting.feedback_responses
  end
end
