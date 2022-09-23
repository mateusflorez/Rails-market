class AdminPolicy < ApplicationPolicy

  def new?
    user.administrator?
  end

  class Scope < Scope
     def resolve
       scope
     end
  end
end
