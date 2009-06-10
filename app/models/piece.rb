class Piece < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :idea
  
  def set_user_id(id)
    self.user_id = id
  end
  
end
