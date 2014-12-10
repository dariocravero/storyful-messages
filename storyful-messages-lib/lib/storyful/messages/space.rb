module Storyful
  module Messages
    class Space
      extend Forwardable
      def_delegators :@messages, :<<, :first, :last, :count, :map, :each
      attr_accessor :label

      def initialize(attrs)
        @label    = attrs.delete :label
        @messages = attrs.delete(:messages) || []
      end

      def all; @messages.dup; end
    end # Message
  end # Messages
end # Storyful
