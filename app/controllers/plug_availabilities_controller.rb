class PlugAvailabilitiesController < ApplicationController
  def index
    @plug_availabilities = PlugAvailability.all

    render("plug_availability_templates/index.html.erb")
  end

  def show
    @study_location_detail = StudyLocationDetail.new
    @plug_availability = PlugAvailability.find(params.fetch("id_to_display"))

    render("plug_availability_templates/show.html.erb")
  end

  def new_form
    @plug_availability = PlugAvailability.new

    render("plug_availability_templates/new_form.html.erb")
  end

  def create_row
    @plug_availability = PlugAvailability.new

    @plug_availability.availability = params.fetch("availability")

    if @plug_availability.valid?
      @plug_availability.save

      redirect_back(:fallback_location => "/plug_availabilities", :notice => "Plug availability created successfully.")
    else
      render("plug_availability_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @plug_availability = PlugAvailability.find(params.fetch("prefill_with_id"))

    render("plug_availability_templates/edit_form.html.erb")
  end

  def update_row
    @plug_availability = PlugAvailability.find(params.fetch("id_to_modify"))

    @plug_availability.availability = params.fetch("availability")

    if @plug_availability.valid?
      @plug_availability.save

      redirect_to("/plug_availabilities/#{@plug_availability.id}", :notice => "Plug availability updated successfully.")
    else
      render("plug_availability_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @plug_availability = PlugAvailability.find(params.fetch("id_to_remove"))

    @plug_availability.destroy

    redirect_to("/plug_availabilities", :notice => "Plug availability deleted successfully.")
  end
end
