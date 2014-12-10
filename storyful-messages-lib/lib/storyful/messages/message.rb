module Storyful
  module Messages
    class Message
      attr_accessor :from, :what
      attr_reader   :when

      def initialize(attrs)
        @from = attrs.delete :from
        @what = attrs.delete :what
        @when = Time.now
      end
    end # Message
  end # Messages
end # Storyful
