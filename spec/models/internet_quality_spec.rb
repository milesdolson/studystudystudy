require 'rails_helper'

RSpec.describe InternetQuality, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:study_location_details) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
