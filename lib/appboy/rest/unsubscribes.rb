module Appboy
  module REST
    class Unsubscribes < Base
      attr_reader :app_group_id, :start_date, :end_date, :offset

      def initialize(app_group_id, start_date:, end_date:, offset:)
        @app_group_id = app_group_id
        @start_date   = start_date
        @end_date     = end_date
        @offset       = offset
      end

      def perform
        http.get '/email/unsubscribes', {
                                     app_group_id: app_group_id,
                                     start_date: start_date,
                                     end_date: end_date,
                                     offset: offset
                                 }
      end
    end
  end
end