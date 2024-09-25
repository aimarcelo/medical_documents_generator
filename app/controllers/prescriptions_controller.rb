# frozen_string_literal: true

class PrescriptionsController < ApplicationController
  def new
    @prescription = Prescription.new
    @patients = Patient.order(:last_name, :first_name)
  end

  def create
    @prescription = Prescription.create(prescription_params)

    respond_to do |format|
      format.html do
        redirect_to prescription_url(@prescription), notice: 'Prescription was successfully created.'
      end
      format.json do
        render json: @prescription, status: :ok
      end
    end
  end

  def index
    @prescriptions = Prescription.all
  end

  def edit
    @prescription = Prescription.find(params[:id])
    @patients = Patient.order(:last_name, :first_name)
  end

  def update
    @prescription = Prescription.find(params[:id])
    @prescription.update(prescription_params)

    respond_to do |format|
      format.html do
        redirect_to edit_prescription_url(@prescription), notice: 'prescription was successfully updated.'
      end
      format.json do
        render json: @prescription, status: 'see other'
      end
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy

    respond_to do |format|
      format.html do
        redirect_to prescriptions_url, notice: 'Prescription was successfully deleted.'
      end
      format.json do
        render json: @prescription, status: 'see other'
      end
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(
      :patient_id, :drug_name, :preparation, :quantity, :dose_and_frequency, :notes
    )
  end
end
