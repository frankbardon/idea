class PiecesController < ApplicationController

  layout "application"
  before_filter :require_user, :except => [:show]

  def index
    @idea   = Idea.find(params[:idea_id])
    @pieces = @idea.pieces.all
    respond_to do |wants|
      wants.html
      wants.xml  { render :xml => @pieces }
      wants.js   { render :json => @pieces }
    end
  end

  def show
    @idea  = Idea.find(params[:idea_id])
    @piece = @idea.pieces.find(params[:id])

    respond_to do |wants|
      wants.html
      wants.xml  { render :xml => @piece }
      wants.js   { render :json => @piece }
    end
  end

  def new
    @idea  = Idea.find(params[:idea_id])
    @piece = @idea.pieces.new

    respond_to do |wants|
      wants.html
      wants.xml  { render :xml => @piece }
      wants.js   { render :json => @piece }
    end
  end

  def edit
    @idea  = Idea.find(params[:idea_id])
    @piece = @idea.pieces.find(params[:id])
  end

  def create
    @idea  = Idea.find(params[:idea_id])
    @piece = @idea.pieces.new(params[:piece])
    @piece.set_user_id(current_user.id)

    respond_to do |wants|
      if @piece.save
        flash[:notice] = 'Piece was successfully created.'
        wants.html { redirect_to(@idea) }
        wants.xml  { render :xml => @piece, :status => :created, :location => @piece }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @piece.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @idea  = Idea.find(params[:idea_id])
    @piece = @idea.pieces.find(params[:id])

    respond_to do |wants|
      if @piece.update_attributes(params[:piece])
        flash[:notice] = 'Piece was successfully updated.'
        wants.html { redirect_to(idea_piece_path(@idea, @piece)) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @piece.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @idea  = Idea.find(params[:idea_id])
    @piece = @idea.pieces.find(params[:id])
    @piece.destroy

    respond_to do |wants|
      wants.html { redirect_to(pieces_url) }
      wants.xml  { head :ok }
      wants.js    { head :ok }
    end
  end
end
