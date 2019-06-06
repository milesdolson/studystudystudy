require 'rails_helper'

RSpec.describe Address, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:locations) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
