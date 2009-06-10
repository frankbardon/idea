class User < ActiveRecord::Base

  acts_as_authentic
  has_many :ideas, :include => :user

  def self.matches_user?(comparison_user)
    self.id == comparison_user.id
  end
end
