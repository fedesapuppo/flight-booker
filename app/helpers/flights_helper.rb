module FlightsHelper
  def format_datetime(datetime)
    datetime.strftime("%B %d, %Y, %I:%M %p")
  end
end
