class Category < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :class_name => "Bookmark",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
