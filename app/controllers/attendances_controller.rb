class AttendancesController < ApplicationController
  def join
    unless Attendance.all.exists?(user_id: current_user.id)
      @attendance = Attendance.new(event_id: params[:id], user_id: current_user.id)
      @attendance.save
      redirect_to events_path
    end
  end
end
