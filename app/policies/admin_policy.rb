# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  def new?
    user.administrator?
  end

  def edit?
    user.administrator?
  end

  def destroy?
    user.administrator?
  end

  def permitted_attributes
    if user.administrator?
      %i[email role password password_confirmation name]
    else
      %i[email password password_confirmation name]
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
