module Appboy
  module Endpoints
    module Unsubscribes
      def unsubscribes(**payload)
        unsubscribes_service.new(app_group_id, payload).perform
      end

      def unsubscribes_service
        Appboy::REST::Unsubscribes
      end
    end
  end
end