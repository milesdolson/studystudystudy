class StudyLocationDetailsController < ApplicationController
  before_action :current_user_must_be_study_location_detail_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_study_location_detail_user
    study_location_detail = StudyLocationDetail.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == study_location_detail.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = StudyLocationDetail.ransack(params[:q])
    @study_location_details = @q.result(:distinct => true).includes(:user, :favorites, :location, :ambience, :noise_level, :internet_quality, :plug_availability).page(params[:page]).per(10)

    render("study_location_detail_templates/index.html.erb")
  end

  def show
    @bookmark = Bookmark.new
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

  def create_row_from_location
    @study_location_detail = StudyLocationDetail.new

    @study_location_detail.ambience_id = params.fetch("ambience_id")
    @study_location_detail.noise_level_id = params.fetch("noise_level_id")
    @study_location_detail.internet_quality_id = params.fetch("internet_quality_id")
    @study_location_detail.plug_availability_id = params.fetch("plug_availability_id")
    @study_location_detail.location_id = params.fetch("location_id")
    @study_location_detail.user_id = params.fetch("user_id")

    if @study_location_detail.valid?
      @study_location_detail.save

      redirect_to("/locations/#{@study_location_detail.location_id}", notice: "StudyLocationDetail created successfully.")
    else
      render("study_location_detail_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_ambience
    @study_location_detail = StudyLocationDetail.new

    @study_location_detail.ambience_id = params.fetch("ambience_id")
    @study_location_detail.noise_level_id = params.fetch("noise_level_id")
    @study_location_detail.internet_quality_id = params.fetch("internet_quality_id")
    @study_location_detail.plug_availability_id = params.fetch("plug_availability_id")
    @study_location_detail.location_id = params.fetch("location_id")
    @study_location_detail.user_id = params.fetch("user_id")

    if @study_location_detail.valid?
      @study_location_detail.save

      redirect_to("/ambiences/#{@study_location_detail.ambience_id}", notice: "StudyLocationDetail created successfully.")
    else
      render("study_location_detail_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_noise_level
    @study_location_detail = StudyLocationDetail.new

    @study_location_detail.ambience_id = params.fetch("ambience_id")
    @study_location_detail.noise_level_id = params.fetch("noise_level_id")
    @study_location_detail.internet_quality_id = params.fetch("internet_quality_id")
    @study_location_detail.plug_availability_id = params.fetch("plug_availability_id")
    @study_location_detail.location_id = params.fetch("location_id")
    @study_location_detail.user_id = params.fetch("user_id")

    if @study_location_detail.valid?
      @study_location_detail.save

      redirect_to("/noise_levels/#{@study_location_detail.noise_level_id}", notice: "StudyLocationDetail created successfully.")
    else
      render("study_location_detail_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_internet_quality
    @study_location_detail = StudyLocationDetail.new

    @study_location_detail.ambience_id = params.fetch("ambience_id")
    @study_location_detail.noise_level_id = params.fetch("noise_level_id")
    @study_location_detail.internet_quality_id = params.fetch("internet_quality_id")
    @study_location_detail.plug_availability_id = params.fetch("plug_availability_id")
    @study_location_detail.location_id = params.fetch("location_id")
    @study_location_detail.user_id = params.fetch("user_id")

    if @study_location_detail.valid?
      @study_location_detail.save

      redirect_to("/internet_qualities/#{@study_location_detail.internet_quality_id}", notice: "StudyLocationDetail created successfully.")
    else
      render("study_location_detail_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_plug_availability
    @study_location_detail = StudyLocationDetail.new

    @study_location_detail.ambience_id = params.fetch("ambience_id")
    @study_location_detail.noise_level_id = params.fetch("noise_level_id")
    @study_location_detail.internet_quality_id = params.fetch("internet_quality_id")
    @study_location_detail.plug_availability_id = params.fetch("plug_availability_id")
    @study_location_detail.location_id = params.fetch("location_id")
    @study_location_detail.user_id = params.fetch("user_id")

    if @study_location_detail.valid?
      @study_location_detail.save

      redirect_to("/plug_availabilities/#{@study_location_detail.plug_availability_id}", notice: "StudyLocationDetail created successfully.")
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
    

    if @study_location_detail.valid?
      @study_location_detail.save

      redirect_to("/study_location_details/#{@study_location_detail.id}", :notice => "Study location detail updated successfully.")
    else
      render("study_location_detail_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_remove"))

    @study_location_detail.destroy

    redirect_to("/users/#{@study_location_detail.user_id}", notice: "StudyLocationDetail deleted successfully.")
  end

  def destroy_row_from_location
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_remove"))

    @study_location_detail.destroy

    redirect_to("/locations/#{@study_location_detail.location_id}", notice: "StudyLocationDetail deleted successfully.")
  end

  def destroy_row_from_ambience
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_remove"))

    @study_location_detail.destroy

    redirect_to("/ambiences/#{@study_location_detail.ambience_id}", notice: "StudyLocationDetail deleted successfully.")
  end

  def destroy_row_from_noise_level
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_remove"))

    @study_location_detail.destroy

    redirect_to("/noise_levels/#{@study_location_detail.noise_level_id}", notice: "StudyLocationDetail deleted successfully.")
  end

  def destroy_row_from_internet_quality
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_remove"))

    @study_location_detail.destroy

    redirect_to("/internet_qualities/#{@study_location_detail.internet_quality_id}", notice: "StudyLocationDetail deleted successfully.")
  end

  def destroy_row_from_plug_availability
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_remove"))

    @study_location_detail.destroy

    redirect_to("/plug_availabilities/#{@study_location_detail.plug_availability_id}", notice: "StudyLocationDetail deleted successfully.")
  end

  def destroy_row
    @study_location_detail = StudyLocationDetail.find(params.fetch("id_to_remove"))

    @study_location_detail.destroy

    redirect_to("/study_location_details", :notice => "Study location detail deleted successfully.")
  end
end
