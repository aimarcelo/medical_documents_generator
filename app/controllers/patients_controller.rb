class PatientsController < ApplicationController
  def new 
    @patient = Patient.new
  end
  
  def index
    @patients = Patient.all
  end
 
  def create
    @patient = user.patients.create(patient_params)

    respond_to do |format|
      format.html do
        redirect_to patients_url(@patient), notice: "Patient was successfully created."
      end
      format.json do
        render json: @patient, status: :ok
      end
    end
  end

  private

  def patient_params
    params.require(:patient).permit(
      :first_name, :last_name, :birthdate, :contact_number, :city, :province 
    )
  end
end
