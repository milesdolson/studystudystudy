class NoiseLevelsController < ApplicationController
  def index
    @noise_levels = NoiseLevel.all

    render("noise_level_templates/index.html.erb")
  end

  def show
    @study_location_detail = StudyLocationDetail.new
    @noise_level = NoiseLevel.find(params.fetch("id_to_display"))

    render("noise_level_templates/show.html.erb")
  end

  def new_form
    @noise_level = NoiseLevel.new

    render("noise_level_templates/new_form.html.erb")
  end

  def create_row
    @noise_level = NoiseLevel.new

    @noise_level.level = params.fetch("level")

    if @noise_level.valid?
      @noise_level.save

      redirect_back(:fallback_location => "/noise_levels", :notice => "Noise level created successfully.")
    else
      render("noise_level_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @noise_level = NoiseLevel.find(params.fetch("prefill_with_id"))

    render("noise_level_templates/edit_form.html.erb")
  end

  def update_row
    @noise_level = NoiseLevel.find(params.fetch("id_to_modify"))

    @noise_level.level = params.fetch("level")

    if @noise_level.valid?
      @noise_level.save

      redirect_to("/noise_levels/#{@noise_level.id}", :notice => "Noise level updated successfully.")
    else
      render("noise_level_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @noise_level = NoiseLevel.find(params.fetch("id_to_remove"))

    @noise_level.destroy

    redirect_to("/noise_levels", :notice => "Noise level deleted successfully.")
  end
end
