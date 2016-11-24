class AuditLogPolicy < ApplicationPolicy

  def index?
    #TODO refactor
    #record.user_id = user.id || admin_types.include?(user.type)
    return true if admin?
  end

  def confirm?
    record.user_id == user.id
  end

  private


  def admin?
    admin_types.include?(user.type)
  end

end
