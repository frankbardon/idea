class IdeasController < ApplicationController

  before_filter :require_user, :except => [:index, :show]
  before_filter :find_idea, :only => [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
    respond_to do |wants|
      wants.html
      wants.xml  { render :xml => @ideas }
      wants.js   { render :json => @ideas }
    end
  end

  def show
    @idea = Idea.find(params[:id])
    respond_to do |wants|
      wants.html
      wants.xml { render :xml => @idea }
      wants.js  { render :json => @idea }
    end
  end
  
  def new
    @idea = Idea.new
    respond_to do |wants|
      wants.html
      wants.xml  { render :xml => @idea }
      wants.js   { render :json => @idea }
    end
  end
  
  def edit
    @idea = Idea.find(params[:id])
  end
  
  def create
    @idea = Idea.new(params[:idea])
    respond_to do |wants|
      if @idea.save
        flash[:notice] = "Successfully created idea."
        wants.html { redirect_to @idea }
        wants.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        wants.html { render :action => 'new' }
        wants.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @idea = Idea.find(params[:id])
    respond_to do |wants|
      if @idea.update_attributes(params[:idea])
        flash[:notice] = "Successfully updated idea."
        wants.html { redirect_to @idea }
        wants.xml  { head :ok }
      else
        wants.html { render :action => 'edit' }
        wants.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = "Successfully destroyed idea."
    respond_to do |wants|
      wants.html { redirect_to(ideas_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_idea
      @idea = Idea.find(params[:id])
    end

end
