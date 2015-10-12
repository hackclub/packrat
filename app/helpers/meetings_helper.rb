module MeetingsHelper
  def meeting_feedback_response_submitter_name(feedback_response)
    submitter = feedback_response.member

    submitter.nil? ? 'N/A' : submitter.full_name
  end

  def meeting_pretty_average_rating(meeting)
    meeting.average_rating.round(1)
  end
end
