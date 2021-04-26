class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      false
    end
  end

  def calculate?
    true if user.admin? || user.premium?
  end

  def new?
    true if user.admin? || user.premium?
  end

  def create?
    true if user.admin? || user.premium?
  end

end
