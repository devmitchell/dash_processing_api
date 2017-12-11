require 'twilio-ruby'

class SmsNotifier
  def initialize
    # put your own credentials here
    account_sid = Settings.twilio.account_sid
    auth_token = Settings.twilio.auth_token

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
  
  def call(recipients:, message:)
    Array(recipients).each do |recipient|
      @client.api.account.messages.create(
        from: Settings.twilio.phone_number,
        to: recipient,
        body: message,
      )
    end
  end
end
