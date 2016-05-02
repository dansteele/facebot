require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger.configure do |config|
  config.access_token = ENV['PAGE_ACCESS_TOKEN']
  config.verify_token = ENV['FB_TOKEN']
end


Bot.on :message do |message|
  Bot.deliver(
    recipient: message.sender,
    message: {
      text: "A member of Omnidev will try and get back to you shortly.\
      If you don't hear from us as quickly as you'd like, please use the contact form at\
       omnidev.co.uk/contact"
    }
  )
end

Facebook::Messenger::Subscriptions.subscribe