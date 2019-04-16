# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :modify, Question, user_id: user.id
    can :modify, Question if user.admin?
    can :modify, Question if user.super_admin?
  end
end
