class Admin::EventsSubmissionsController < ApplicationController
	before_action :authenticate_user!
  before_action :check_if_admin
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(reviewed: false)
  end

  def show

  end

  def update #to validate
  	@event.reviewed = true
  	@event.validated = true
  	if @event.save
  		redirect_to admin_events_submissions_path
  	else
  		render :show
  	end
  end

  def destroy #to invalidate
  	@event.reviewed = true
  	@event.validated = false
  	if @event.save
  		redirect_to admin_events_submissions_path
  	else
  		render :show
  	end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :event_pic)
  end

  def redirect_to_root
    redirect_to events_path
  end

  def check_if_admin
    redirect_to_root if !current_user.is_admin
  end
end
