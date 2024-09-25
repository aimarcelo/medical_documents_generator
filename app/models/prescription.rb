# frozen_string_literal: true

class Prescription < ApplicationRecord
  belongs_to :patient

  def date_created
    created_at.strftime('%b %d, %Y')
  end

  def date_updated
    updated_at.strftime('%b %d, %Y')
  end
end
