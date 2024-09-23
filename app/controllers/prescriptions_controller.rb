class PrescriptionsController < ApplicationController
  def create
    @prescription = Prescription.create(prescription_params)

    respond_to do |format|
      format.html do
        redirect_to prescription_url(@prescription), notice: "Prescription was successfully created."
      end
      format.json do
        render json: @prescription, status: :ok
      end
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(
      :patient_id, :content
    )
  end
end
