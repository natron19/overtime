class AuditLogPolicy < ApplicationPolicy

  def index?
    #record.user_id = user.id || admin_types.include?(user.type)
    return true if admin?
  end

  # def approve?
  #   admin?
  # end

  private


  def admin?
    admin_types.include?(user.type)
  end

end
