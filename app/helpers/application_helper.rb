module ApplicationHelper
  def format_day_of_month(date)
    date.strftime('%m/%d/%Y')
  end
end
