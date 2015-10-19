module ClubsHelper
  def club_previous_attendee_count(club)
    if club && club.meetings
      previous_meeting = club.meetings.find_by(["created_at < ?", Date.today])

      previous_meeting.blank? ? 'N/A' : previous_meeting.feedback_responses.length
    end
    'N/A'
  end

  def club_last_attendee_count(club)
    last_meeting = club.meetings.last

    last_meeting ? last_meeting.attendee_count : 'N/A'
  end

  def club_last_meeting_date(club)
    date = club.last_meeting_date

    date.nil? ? 'N/A' : format_day_of_month(date)
  end

  def club_last_average_rating(club)
    meeting = club.meetings.last

    meeting.nil? ? 'N/A' : meeting.average_rating
  end

  def club_meetings_chart_labels(club)
    club.meetings.map { |m| m.id }
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

    if last_meeting.nil? || comparison_meeting.nil?
      return nil
    end

    last_meeting.attendee_count_percentage_delta(comparison_meeting)
  end

  def club_meetings_average_rating_percentage_delta(club)
    last_meeting = club.meetings[-1]
    comparison_meeting = club.meetings[-2]

    if last_meeting.nil? || comparison_meeting.nil?
      return nil
    end

    last_meeting.average_rating_percentage_delta(comparison_meeting)
  end
end
