class StudyLocationDetailsController < ApplicationController
  def index
    @study_location_details = StudyLocationDetail.all

    render("study_location_detail_templates/index.html.erb")
  end

  def show
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_display"))

    render("study_location_detail_templates/show.html.erb")
  end

  def new_form
    @study_location_detail = StudyLocationDetail.new

    render("study_location_detail_templates/new_form.html.erb")
  end

  def create_row
    @study_location_detail = StudyLocationDetail.new

    @study_location_detail.ambience_id = params.fetch("ambience_id")
    @study_location_detail.noise_level_id = params.fetch("noise_level_id")
    @study_location_detail.internet_quality_id = params.fetch("internet_quality_id")
    @study_location_detail.plug_availability_id = params.fetch("plug_availability_id")
    @study_location_detail.location_id = params.fetch("location_id")
    @study_location_detail.user_id = params.fetch("user_id")

    if @study_location_detail.valid?
      @study_location_detail.save

      redirect_back(:fallback_location => "/study_location_details", :notice => "Study location detail created successfully.")
    else
      render("study_location_detail_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @study_location_detail = StudyLocationDetail.find(params.fetch("prefill_with_id"))

    render("study_location_detail_templates/edit_form.html.erb")
  end

  def update_row
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_modify"))

    @study_location_detail.ambience_id = params.fetch("ambience_id")
    @study_location_detail.noise_level_id = params.fetch("noise_level_id")
    @study_location_detail.internet_quality_id = params.fetch("internet_quality_id")
    @study_location_detail.plug_availability_id = params.fetch("plug_availability_id")
    @study_location_detail.location_id = params.fetch("location_id")
    @study_location_detail.user_id = params.fetch("user_id")

    if @study_location_detail.valid?
      @study_location_detail.save

      redirect_to("/study_location_details/#{@study_location_detail.id}", :notice => "Study location detail updated successfully.")
    else
      render("study_location_detail_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_remove"))

    @study_location_detail.destroy

    redirect_to("/study_location_details", :notice => "Study location detail deleted successfully.")
  end
end
