# module SlackNotifier
#     CLIENT = Slack::Notifier.new Rails.application.credentials.slack[:token]
#   end

require 'slack-notifier'
notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
notifier.ping "Hello World from #{Rails.application.class.parent_name}"