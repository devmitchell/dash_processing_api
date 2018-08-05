class SmsNotificationJob < ApplicationJob
  queue_as :notifications

  def perform(recipients:, message:)
    notifier = SmsNotifier.new
    notifier.call(recipients: recipients, message: message)
  end
end
