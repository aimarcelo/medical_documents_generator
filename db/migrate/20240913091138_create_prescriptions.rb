# frozen_string_literal: true

class CreatePrescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.text :drug_name
      t.text :preparation
      t.text :dose_and_frequency
      t.text :quantity
      t.text :notes

      t.belongs_to :patient
      t.timestamps
    end
  end
end
