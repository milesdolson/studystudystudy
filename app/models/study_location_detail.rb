class StudyLocationDetail < ApplicationRecord
  # Direct associations

  belongs_to :plug_availability

  belongs_to :internet_quality

  belongs_to :noise_level

  belongs_to :ambience

  belongs_to :location

  has_many   :favorites,
             :class_name => "Bookmark",
             :foreign_key => "study_location_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
