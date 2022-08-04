class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User

    return unless user.present?

    can :manage, Group, user: user
    can :manage, Expense, user:
  end
end
