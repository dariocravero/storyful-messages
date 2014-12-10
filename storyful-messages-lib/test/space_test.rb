setup do
  Storyful::Messages::Space.new(label: 'space 1')
end

test "we can have a space" do |space|
  assert_equal  space.label, 'space 1'
  assert        space.all.is_a?(Array)
end

test "we can have messages in a space" do |space|
  assert_equal space.count, 0

  space << Storyful::Messages::Space.new(from: 'dario', what: 'hi')
  space << Storyful::Messages::Space.new(from: 'paul', what: 'hi')

  assert_equal space.count, 2
  assert_equal space.all.count, 2
end

test "we can't tinker with the list of messages" do |space|
  assert_raise(NoMethodError) do
    space.messages
  end

  space << Storyful::Messages::Space.new(from: 'dario', what: 'hi')
  space << Storyful::Messages::Space.new(from: 'paul', what: 'hi')

  assert_equal space.count, 2

  space.all.pop

  assert_equal space.count, 2
end
