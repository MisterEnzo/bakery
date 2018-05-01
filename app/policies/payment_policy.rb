class PaymentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user_is_owner?
  end

  def create?
    user_is_owner?
  end

  private
    def user_is_owner?
      record.user == user
    end
end
