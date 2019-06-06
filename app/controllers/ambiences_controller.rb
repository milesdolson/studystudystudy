class AmbiencesController < ApplicationController
  def index
    @ambiences = Ambience.page(params[:page]).per(10)

    render("ambience_templates/index.html.erb")
  end

  def show
    @study_location_detail = StudyLocationDetail.new
    @ambience = Ambience.find(params.fetch("id_to_display"))

    render("ambience_templates/show.html.erb")
  end

  def new_form
    @ambience = Ambience.new

    render("ambience_templates/new_form.html.erb")
  end

  def create_row
    @ambience = Ambience.new

    @ambience.description = params.fetch("description")

    if @ambience.valid?
      @ambience.save

      redirect_back(:fallback_location => "/ambiences", :notice => "Ambience created successfully.")
    else
      render("ambience_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ambience = Ambience.find(params.fetch("prefill_with_id"))

    render("ambience_templates/edit_form.html.erb")
  end

  def update_row
    @ambience = Ambience.find(params.fetch("id_to_modify"))

    @ambience.description = params.fetch("description")

    if @ambience.valid?
      @ambience.save

      redirect_to("/ambiences/#{@ambience.id}", :notice => "Ambience updated successfully.")
    else
      render("ambience_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @ambience = Ambience.find(params.fetch("id_to_remove"))

    @ambience.destroy

    redirect_to("/ambiences", :notice => "Ambience deleted successfully.")
  end
end
