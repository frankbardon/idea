class PagesController < ApplicationController

  def index
    @ideas = Idea.find(:all)
  end

end
