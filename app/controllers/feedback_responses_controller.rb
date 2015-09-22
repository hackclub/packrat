class FeedbackResponsesController < ApplicationController
  before_action :set_feedback_response, only: [:show]
  before_action :authenticate_club_member!, only: [:new]
  before_action :authenticate_club_leader!, only: [:index, :show]

  def index
    @feedback_responses = FeedbackResponse.all
  end

  def show
  end

  def new
    @feedback_response = FeedbackResponse.new
  end

  def create
    # If this is the first meeting for the club, create a new meeting
    unless @last_meeting = current_club_member.club.meetings.last
      Meeting.create(club_id: current_club_member.club_id)
      @last_meeting = current_club_member.club.meetings.last
    end

    @feedback_response = FeedbackResponse.new(feedback_response_params)
    @feedback_response.update(meeting_id: @last_meeting.id)

    respond_to do |format|
      if @feedback_response.save
        format.html { redirect_to feedback_received_path, notice: 'Feedback response was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def received
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_response
      @feedback_response = FeedbackResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_response_params
      params.require(:feedback_response).permit(:meeting_id, :rating)
    end
end
