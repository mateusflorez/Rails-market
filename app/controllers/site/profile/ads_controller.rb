class Site::Profile::AdsController < Site::ProfileController
  def index
    @categories = Category.order_by_description
    @ads = Ad.member_ads(current_member)
  end
end
