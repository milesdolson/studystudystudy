class InternetQualitiesController < ApplicationController
  def index
    @internet_qualities = InternetQuality.all

    render("internet_quality_templates/index.html.erb")
  end

  def show
    @internet_quality = InternetQuality.find(params.fetch("id_to_display"))

    render("internet_quality_templates/show.html.erb")
  end

  def new_form
    @internet_quality = InternetQuality.new

    render("internet_quality_templates/new_form.html.erb")
  end

  def create_row
    @internet_quality = InternetQuality.new

    @internet_quality.quality = params.fetch("quality")

    if @internet_quality.valid?
      @internet_quality.save

      redirect_back(:fallback_location => "/internet_qualities", :notice => "Internet quality created successfully.")
    else
      render("internet_quality_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @internet_quality = InternetQuality.find(params.fetch("prefill_with_id"))

    render("internet_quality_templates/edit_form.html.erb")
  end

  def update_row
    @internet_quality = InternetQuality.find(params.fetch("id_to_modify"))

    @internet_quality.quality = params.fetch("quality")

    if @internet_quality.valid?
      @internet_quality.save

      redirect_to("/internet_qualities/#{@internet_quality.id}", :notice => "Internet quality updated successfully.")
    else
      render("internet_quality_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @internet_quality = InternetQuality.find(params.fetch("id_to_remove"))

    @internet_quality.destroy

    redirect_to("/internet_qualities", :notice => "Internet quality deleted successfully.")
  end
end
