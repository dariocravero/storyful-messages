StoryfulMessagesApp::App.controllers :messages, parent: :spaces, provides: :json do
  before do
    @space = space params[:space_id]
  end

  get :index do
    # TODO Should actually render messages alone
    render :space
  end

  post :create, map: '/spaces/:space_id/messages', params: [:from, :what, :space_id] do
    @message = Storyful::Messages::Message.new(from: params[:from], what: params[:what])

    message! @message, @space

    render :message
  end
end
