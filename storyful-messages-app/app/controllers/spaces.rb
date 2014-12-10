StoryfulMessagesApp::App.controllers :spaces, provides: :json do
  get :index do
    @spaces = spaces
    render :spaces
  end

  post :create, map: '/spaces', params: [:label] do
    @space = space params[:label]

    unless @space
      @space = Storyful::Messages::Space.new(label: params[:label])
      space! @space
    end

    render :space
  end

  get :read, map: '/spaces/:label', params: [:label] do
    @space = space params[:label]
    error 404 unless @space

    render :space
  end
end
