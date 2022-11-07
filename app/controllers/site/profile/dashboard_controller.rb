# frozen_string_literal: true

module Site
  module Profile
    class DashboardController < Site::ProfileController
      def index
        @categories = Category.order_by_description
      end
    end
  end
end
