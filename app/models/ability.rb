# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Appointment

    if user.patient?
      can :create, Appointment
      can :destroy, Appointment, patient: user, closed: false
      can :read, User, role: 'doctor'
    elsif user.doctor?
      can :update, Appointment, doctor: user
      can :edit, Appointment

      can :read, Category
      can :join_to, Category
      can :leave, Category
    end
  end
end
