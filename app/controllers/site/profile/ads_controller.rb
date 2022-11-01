# frozen_string_literal: true

module Site
  module Profile
    class AdsController < Site::ProfileController
      before_action :set_ad, only: [:edit]

      def index
        @ads = Ad.member_ads(current_member)
      end

      def edit; end

      private

      def set_ad
        @ad = Ad.find(params[:id])
      end
    end
  end
end
