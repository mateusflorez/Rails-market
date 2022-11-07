# frozen_string_literal: true

module Site
  module Profile
    class AdsController < Site::ProfileController
      before_action :set_ad, only: %i[edit update]

      def index
        @ads = Ad.member_ads(current_member)
        @categories = Category.order_by_description
      end

      def edit
        @categories = Category.order_by_description
      end

      def update
        if @ad.update(ad_params)
          redirect_to site_profile_ads_path, notice: 'Ad successfuly updated!'
        else
          render :edit
        end
      end

      def new
        @ad = Ad.new
        @categories = Category.order_by_description
      end

      def create
        @ad = Ad.new(ad_params)
        @ad.member = current_member

        if @ad.save
          redirect_to site_profile_ads_path, notice: 'Ad successfuly created!'
        else
          render :new
        end
      end

      private

      def set_ad
        @ad = Ad.find(params[:id])
      end

      def ad_params
        params.require(:ad).permit(:id, :title, :category_id, :price, :description, :picture, :finish_date)
      end
    end
  end
end
