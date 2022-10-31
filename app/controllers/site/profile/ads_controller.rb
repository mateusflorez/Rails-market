class Site::Profile::AdsController < Site::ProfileController
  def index
    @categories = Category.order_by_description
    @ads = Ad.where(member_id: current_member.id)
  end
end
