class PagesController < ApplicationController

  layout "application"

  def index
    @ideas = Idea.find(:all)
  end

end
