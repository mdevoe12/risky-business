class Permission
  def initialize(current_user, controller, action, id)
    @user = current_user
    @controller = controller
    @action = action
    @id = id
  end

  def authorized?
    @user.class == Supervisor ? supervisor_permissions : manager_permissions
  end

  private

  def supervisor_permissions
    return true if @controller == 'sessions'    && @action.in?(%w(new destroy))
    return true if @controller == 'supervisors' && @action.in?(%w(index show))
    return true if @controller == 'followups'   && @action.in?(%w(index))
    return true if @controller == 'flras'       && @action.in?(%w(index))
    return true if @controller == 'insights'    && @action.in?(%w(index))
    return true if @controller == 'support'     && @action.in?(%w(index))
    return true if @controller == 'workers'     && @action.in?(%w(index))
  end

  def manager_permissions
    return true if @controller == 'sessions' && @action.in?(%w(new destroy))
    return true if @controller == 'managers' && @action.in?(%w(index show))
  end
end
