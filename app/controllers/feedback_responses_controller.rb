class FeedbackResponsesController < ApplicationController
  before_action :set_feedback_response, only: [:show]
  before_action :authenticate_club_member_without_flash!, only: [:new]
  before_action :authenticate_club_leader!, only: [:index, :show]

  def index
    @feedback_responses = current_club_leader.clubs
  end

  def show
  end

  def new
    @feedback_response = FeedbackResponse.new
    @new_user = (!(current_club_member.full_name && current_club_member.full_name) || false)
    @clubs = Club.all
  end

  def create
    # If this is the first submission by the club member, record their club and
    # full name...
    unless current_club_member.full_name
      @full_name = feedback_response_params['full_name']
      current_club_member.update(full_name: @full_name)
    end
    # ... and their club
    unless current_club_member.club
      @club = feedback_response_params['club']
      current_club_member.update(club: @club)
    end

    # If this is the first feedback for the day, create a new meeting
    unless current_club_member.club && @current_meeting = current_club_member.club.meetings.find_by(created_at: Date.today)
      @current_meeting = Meeting.create(club: current_club_member.club)
    end

    @feedback_response = FeedbackResponse.new(feedback_response_params)
    @feedback_response.update(meeting: @current_meeting)

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
      params.require(:feedback_response).permit(:meeting_id, :rating, :full_name, :club)
    end

    # Redirects club member to login page if they're not signed in and doesn't
    # flash
    def authenticate_club_member_without_flash!
      unless club_member_signed_in?
        redirect_to new_club_member_session_path
      end
    end
end
