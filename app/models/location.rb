class Location < ApplicationRecord
  # Direct associations

  has_many   :study_location_details,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
