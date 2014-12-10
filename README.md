# storyful-messages

## storyful-messages-lib

Send messages.

It exposes two primitives: `Message` and `Space`. A message could live in a space.

```
  require 'storyful/messages/message'
  message = Storyful::Messages::Message.new(from: 'dario', what: 'hi')
  message.from #=> 'dario'
  message.what #=> 'hi'
  message.when #=> (an instance of Time)

  require 'storyful/messages/space'
  space = Storyful::Messages::Space.new(label: 'space')
  space << message
  space.count #=> 1
  space.first.from #=> 'dario'
```
