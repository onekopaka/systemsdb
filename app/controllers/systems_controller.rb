class SystemsController < ApplicationController
  # include AuthenticatedSystem
  current_user = @user
  def index
    @systems = System.all(:order => :make)
    prawnto :prawn=>{ :page_layout=>:landscape }
  end
  
  def show
    @system = System.find(params[:id])
  end
  
  def new
  	if logged_in?
      @system = System.new
    else
      flash[:error] = "Permission denied."
      redirect_to systems_url
    end
  end
  
  def create
    @system = System.new(params[:system])
    if @system.save
      flash[:notice] = "Successfully created system."
      redirect_to @system
    else
      render :action => 'new'
    end
  end
  
  def edit
    @system = System.find(params[:id])
  end
  
  def update
    @system = System.find(params[:id])
    if @system.update_attributes(params[:system])
      flash[:notice] = "Successfully updated system."
      redirect_to @system
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    if @user && @user.admin
      @system = System.find(params[:id])
      @system.destroy
      flash[:notice] = "Successfully destroyed system."
      redirect_to systems_url
    else
      flash[:error] = "Permission denied."
      redirect_to systems_url
    end
  end

  def find_by_barcode
    @system = System.find_by_Barcode(params[:id])
  end
end
