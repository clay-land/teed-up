class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == record.user || user == record.bag.user
  end

  def create?
    true
  end

  def update?
    user == record.bag.user
  end

  def destroy?
    user == record.user || user == record.bag.user
  end

  def accept?
    user == record.bag.user
  end
end
