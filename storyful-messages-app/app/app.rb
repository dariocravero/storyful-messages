module StoryfulMessagesApp
  class App < Padrino::Application
    register Padrino::Helpers

    enable  :sessions
    disable :protection
    disable :protect_from_csrf

    set :spaces, []

    get :index do
      render :index
    end
  end
end
