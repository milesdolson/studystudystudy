require 'rails_helper'

RSpec.describe StudyLocationDetail, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:plug_availability) }

    it { should belong_to(:internet_quality) }

    it { should belong_to(:noise_level) }

    it { should belong_to(:ambience) }

    it { should belong_to(:location) }

    it { should have_many(:favorites) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
