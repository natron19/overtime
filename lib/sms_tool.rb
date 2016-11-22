module SmsTool
  #send your credentials
  account_sid = ENV["TWILIO_ACCOUNT_SID"]
  auth_token = ENV["TWILIO_AUTH_TOKEN"]
  #instanciate a connection
  @client = Twilio::REST::Client.new account_sid, auth_token
  #send message to a number
  def self.send_sms(number:, message:)
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: "+1{number}",
      body: "{message}"
      )
  end
end
