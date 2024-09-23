class PatientsController < ApplicationController
  def new 
    @patient = Patient.new
  end
  
  def index
    @patients = Patient.order(:last_name, :first_name)
  end

  def create
    @patient = Patient.create(patient_params)

    respond_to do |format|
      format.html do
        redirect_to patients_url(@patient), notice: "Patient was successfully created."
      end
      format.json do
        render json: @patient, status: :ok
      end
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
   
    respond_to do |format|
      format.html do
        redirect_to patient_url(@patient), notice: "Patient was successfully updated."
      end
      format.json do
        render json: @patient, status: "see other"
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html do
        redirect_to patients_url, notice: "Patient was successfully deleted."
      end
      format.json do
        render json: @patient, status: "see other"
      end
    end
  end
 
  private

  def patient_params
    params.require(:patient).permit(
      :first_name, :last_name, :middle_name, :birthdate, :email, :contact_number, :city, :province 
    )
  end
end
