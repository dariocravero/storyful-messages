StoryfulMessagesApp::App.controllers :ws do
  websocket :spaces, with: :space, params: [:space] do
    on :message do |message|
      # send_message(params[:space], session['websocket_user'], {pong: true, data: message})
      @space    = space(message['space'])
      @message  = message! Storyful::Messages::Message.new(from: message['from'], what: message['what']), @space

      broadcast(:spaces, {
          event: 'message',
          data: @message,
          timestamp: Time.now.to_i
        }, [session['websocket_user']])
    end

    on :label do |message|
      @space    = space(message['space'])
      send_message(:spaces, session['websocket_user'], {
        event:  'label',
        data:   {
          label: @space.label
        }
      })
    end

    on :messages do |message|
      @space    = space(message['space'])
      # require 'pry'
      # binding.pry
      send_message(:spaces, session['websocket_user'], {
        event:  'messages',
        data:   {
          messages: @space.all
        }
      })
    end
  end
end
