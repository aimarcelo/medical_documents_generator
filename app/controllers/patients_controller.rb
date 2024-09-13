class PatientsController < ApplicationController
  def create
    @patient = user.patients.create(patient_params)

    respond_to do |format|
      format.html do
        redirect_to patient_url(@patient), notice: "Patient was successfully created."
      end
      format.json do
        render json: @patient, status: :ok
      end
    end
  end

  private

  def patient_params
    params.require(:patient).permit(
      :first_name, :last_name, :birthdate, :address, :contact_number 
    )
  end
end
