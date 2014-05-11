require 'livestatus/statistic'

ActiveSupport::Notifications.subscribe /process_action.action_controller/ do |name, start, finish, id, payload|
  # Save the payload
  return if payload[:controller] == "Livestatus::DashboardController" && payload[:action] == "stream"
  Livestatus::Statistic.save_notification payload
end
