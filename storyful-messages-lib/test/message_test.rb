setup do
  Storyful::Messages::Message.new(from: 'dario', what: 'hi')
end

test "we can store a message" do |message|
  assert_equal  message.from, 'dario'
  assert_equal  message.what, 'hi'
  assert        message.when.is_a?(Time)
end

test "we can't tinker with the sent timestamp" do |message|
  assert_raise(NoMethodError) do
    message.when = 'change'
  end
end
