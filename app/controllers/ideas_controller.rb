class IdeasController < ApplicationController

  before_filter :require_user, :except => [:index, :show]

  def show
    @idea = Idea.find(params[:id])
  end
  
  def new
    @idea = Idea.new
  end
  
  def create
    @idea = Idea.new(params[:idea])
    if @idea.save
      flash[:notice] = "Successfully created idea."
      redirect_to @idea
    else
      render :action => 'new'
    end
  end
  
  def edit
    @idea = Idea.find(params[:id])
  end
  
  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params[:idea])
      flash[:notice] = "Successfully updated idea."
      redirect_to @idea
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = "Successfully destroyed idea."
    redirect_to ideas_url
  end
end
