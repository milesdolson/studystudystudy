class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :category

  belongs_to :study_location,
             :class_name => "StudyLocationDetail"

  # Indirect associations

  # Validations

end
