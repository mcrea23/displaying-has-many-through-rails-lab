class AppointmentsController < ApplicationController

  
  def show
    @appointment = Appointment.find(params[:id])
  end

  def new 
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  private 
    def appointment_params
      params.require(:appointment).permit(:patient_id, :doctor_id, :appointment_datetime)
    end
end
