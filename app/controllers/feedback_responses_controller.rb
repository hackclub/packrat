class FeedbackResponsesController < ApplicationController
  before_action :authenticate_member!, only: [:new]

  def new
    @feedback_response = FeedbackResponse.new
    @clubs = Club.all
    @current_club = current_member.club
  end

  def create
    # If this is the first submission by the club member, record their club,
    # phone number, and full name
    if current_member.user.name.blank?
      @name = member_params[:name]
      current_member.user.update(name: @name)
    end
    # ... and phone number
    if current_member.user.phone.blank?
      phone = member_params[:phone]
      current_member.user.update(phone: phone)
    end
    # ... and their club
    if current_member.club.blank?
      @club = Club.find(member_params[:club_id])
      current_member.update(club: @club)
    end

    # If this is the first feedback for the day, create a new meeting
    @current_meeting = current_member.club.meetings.find_by(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    if @current_meeting.nil?
      @current_meeting = Meeting.create(club: current_member.club)
    end

    @feedback_response = FeedbackResponse.new(feedback_response_params)
    @feedback_response.meeting = @current_meeting
    @feedback_response.member = current_member

    respond_to do |format|
      if @feedback_response.save
        analytics.track_feedback_form_submission
        format.html { redirect_to received_feedback_responses_path,
            notice: 'Feedback response was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def received
  end

  private
    # If the form included parameters for the club member (like their name or
    # club), then it'll be present here.
    def member_params
      params.permit(:name, :club_id, :phone)
    end

    # Never trust parameters from the scary internet, only allow the white list
    # through.
    def feedback_response_params
      params.require(:feedback_response).permit(
        :meeting_id, :one_thing_to_improve_on, :one_thing_done_well, :rating,
        :anything_else_to_share, :project_description
      )
    end
end
