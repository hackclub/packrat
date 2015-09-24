module ClubsHelper
  def club_last_attendee_count(club)
    club.meetings.last.attendee_count || 'N/A'
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

  def club_meetings_attendee_count_percentage_delta(club)
    last_meeting = club.meetings[-1]
    comparison_meeting = club.meetings[-2]

    last_meeting.attendee_count_percentage_delta(comparison_meeting)
  end

  def club_meetings_average_rating_percentage_delta(club)
    last_meeting = club.meetings[-1]
    comparison_meeting = club.meetings[-2]

    last_meeting.average_rating_percentage_delta(comparison_meeting)
  end
end
