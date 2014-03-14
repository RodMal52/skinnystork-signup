class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (not logged  in)
        if user.has_role? :admin
            can :manage, :all
        else
            can :view, :bold_moves if user.has_role? :bold_moves
            can :view, :fusion if user.has_role? :fusion
            can :view, :fit_lifestyle if user.has_role? :fit_lifestyle
        end 
    end
end