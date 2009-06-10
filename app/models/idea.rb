class Idea < ActiveRecord::Base

  belongs_to :user, :counter_cache => true
  has_many :pieces

  def set_user_id(id)
    self.user_id = id
  end

end