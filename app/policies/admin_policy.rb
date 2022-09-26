class AdminPolicy < ApplicationPolicy

  def new?
    user.administrator?
  end

  def edit?
    user.administrator?
  end

  def permitted_attributes
    if user.administrator?
      [:email, :role, :password, :password_confirmation, :name]
    else
      [:email, :password, :password_confirmation, :name]
    end
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
