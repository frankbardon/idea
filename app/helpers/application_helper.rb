# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def link_to_current_user
    link_to current_user.username, current_user
  end
  
  def is_current_user?(comparison_user)
    current_user && (current_user.id == comparison_user.id)
  end
  
end
