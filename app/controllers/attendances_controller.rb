class AttendancesController < ApplicationController
  def join
    byebug
    @attendance = Attendance.new(event_id: params[:id], user_id: current_user.id)
    
    if @attendance.save
      redirect_to events_path      
    else
      # render "event/#{@event}/show"
    end
  end
end

