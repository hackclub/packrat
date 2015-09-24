module ClubsHelper
  def club_last_feedback_count(club)
    club.last_feedback_count || 'N/A'
  end

  def club_last_meeting_date(club)
    date = club.last_meeting_date

    date.nil? ? 'N/A' : date.strftime('%m/%d/%Y')
  end

  def club_last_average_rating(club)
    meeting = club.meetings.last

    meeting.nil? ? 'N/A' : meeting.average_rating
  end

  def club_meetings_chart_labels(club)
    [
      data: club.meetings.map { |m| m.id }
    ]
  end

  def club_meetings_attendees_chart_data(club)
    [
      {
        data: club.meetings.map { |m| m.feedback_responses.count }
      }
    ]
  end

  def club_meetings_rating_chart_data(club)
    [
      {
        data: club.meetings.map { |m| m.average_rating }
      }
    ]
  end
end
