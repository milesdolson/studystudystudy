class Address < ApplicationRecord
  # Direct associations

  has_many   :locations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
