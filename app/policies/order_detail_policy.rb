class OrderDetailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    record.user == user || user.admin
  end

  def create?
    record.user == user || user.admin
  end

  private
    def user_is_owner_or_admin?
      record.user == user || user.admin
    end
end
