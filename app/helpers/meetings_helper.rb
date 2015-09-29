module MeetingsHelper
  def meeting_feedback_response_submitter_name(feedback_response)
    submitter = feedback_response.club_member

    submitter.nil? ? 'N/A' : submitter.full_name
  end
end
