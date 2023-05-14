module ActivitiesHelper
  def format_duration(duration)
    hours = duration / 60
    minutes = duration % 60
    "#{hours}h #{minutes}m"
  end
end

