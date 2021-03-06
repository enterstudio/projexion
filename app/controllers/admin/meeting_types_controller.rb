class Admin::MeetingTypesController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @meeting_types = @current_account.meeting_types
  end

  def new
    @meeting_type = MeetingType.new
  end

  def show
    @meeting_type = MeetingType.find(params[:id])
  end

  def edit
    @meeting_type = MeetingType.find(params[:id])  
  end

  def create
    @meeting_type = MeetingType.new(params[:meeting_type])
    @meeting_type.account = @current_account

    respond_with(@meeting_type) do |format|
      if @meeting_type.save
        format.html { redirect_to admin_meeting_type_path(@meeting_type), :notice => 'Meeting type was successfully added.' }
      else
        format.html { render :action => :new }
      end
    end
  end

  def update
    @meeting_type = MeetingType.find(params[:id])

    respond_with(@meeting_type) do |format|
      if @meeting_type.update_attributes(params[:meeting_type])
        format.html { redirect_to admin_meeting_type_path(@meeting_type), :notice => 'Meeting type was successfully updated.' }
      else
        format.html { render :action => :edit }
      end
    end
  end

  def destroy
    @meeting_type = MeetingType.find(params[:id])

    @meeting_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_meeting_types_path, :notice => 'Meeting type was successfully deleted.' }
    end
  end
end