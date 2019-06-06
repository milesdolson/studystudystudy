class Location < ApplicationRecord
  # Direct associations

  belongs_to :address

  has_many   :study_location_details,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
