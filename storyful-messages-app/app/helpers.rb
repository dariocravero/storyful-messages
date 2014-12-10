# Helper methods defined here can be accessed in any controller or view in the application

module StoryfulMessagesApp
  class App
    module Helper
      def spaces
        settings.spaces
      end

      def space(label)
        spaces.find { |space| space.label == label }
      end

      def space!(space)
        settings.spaces << space
      end

      def message!(message, space)
        settings.spaces[spaces.index(space)] << message
        message
      end
    end

    helpers Helper
  end
end
