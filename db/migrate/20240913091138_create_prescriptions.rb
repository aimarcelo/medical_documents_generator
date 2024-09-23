class CreatePrescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.text :drug_name
      t.text :dosage_and_preparation
      t.text :frequency
      t.text :quantity
      t.text :notes

      t.belongs_to :patient
      t.timestamps
    end
  end
end
