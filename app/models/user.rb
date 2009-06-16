class User < ActiveRecord::Base

  acts_as_authentic   
  has_many :ideas, :include => :user

  # Reprogram rails to use username instead of id for routes
  def to_param
    self.username
  end

  # If input is numeric, find user by id, else look for the username
  def self.find_by_username_or_id(input)
    if input.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) != nil
      find(input)
    else
      find_by_username(input)
    end
  end

  def self.matches_user?(comparison_user)
    self.id == comparison_user.id
  end
end
