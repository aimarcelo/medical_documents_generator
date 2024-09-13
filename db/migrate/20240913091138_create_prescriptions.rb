class CreatePrescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.text :content
      t.belongs_to :patient
      t.timestamps
    end
  end
end