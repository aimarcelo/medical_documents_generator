class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :city
      t.string :province
      t.string :email
      t.string :contact_number
      t.datetime :birthdate

      t.timestamps
    end
  end
end