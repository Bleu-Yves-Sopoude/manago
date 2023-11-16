class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new # Guest user

    can :manage, :all
    can :read, Purchase
    can :read, Category
    can :create, Category
    can :manage, Category
  end
end
