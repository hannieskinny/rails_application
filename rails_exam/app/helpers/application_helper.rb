module ApplicationHelper
  
  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def current_user
     User.find_by_id!(session[:user_id]) if session[:user_id] != nil
  end
end

