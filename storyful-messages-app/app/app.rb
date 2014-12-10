module StoryfulMessagesApp
  class App < Padrino::Application
    register Padrino::Helpers
    register Padrino::WebSockets

    enable  :sessions
    disable :protection
    disable :protect_from_csrf

    set :spaces, [Storyful::Messages::Space.new(label: 'space')]

    get :index do
      render :index
    end
  end
end
