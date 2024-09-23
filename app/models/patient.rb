# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :prescriptions, dependent: :destroy

  def full_name
    "#{last_name}, #{first_name} "
  end

  def city_address
    "#{city}, #{province}"
  end

  def age
    now = Time.now.utc.to_date
    past_birthdate_this_year = now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)
    now.year - birthdate.year - (past_birthdate_this_year ? 0 : 1)
  end
end
