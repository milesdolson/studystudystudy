class StudyLocationDetail < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :class_name => "Bookmark",
             :foreign_key => "study_location_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
