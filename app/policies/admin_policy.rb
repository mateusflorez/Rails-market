class AdminPolicy < ApplicationPolicy

  def new?
    user.administrator?
  end

  class Scope < Scope
     def resolve
       if user.administrator?
        scope.all
       else
        scope.moderators
       end
     end
  end
end
