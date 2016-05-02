require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger.configure do |config|
  config.access_token = ENV['PAGE_ACCESS_TOKEN']
  config.verify_token = ENV['FB_TOKEN']
end


Bot.on :message do |message|
  message.id      # => 'mid.1457764197618:41d102a3e1ae206a38'
  message.sender  # => { 'id' => '1008372609250235' }
  message.seq     # => 73
  message.sent_at # => 2016-04-22 21:30:36 +0200
  message.text    # => 'Hello, bot!'

  Bot.deliver(
    recipient: message.sender,
    message: {
      text: 'Hello, human!'
    }
  )
end

Facebook::Messenger::Subscriptions.subscribe