class BookmarksController < ApplicationController
  def index
    @q = Bookmark.ransack(params[:q])
    @bookmarks = @q.result(:distinct => true).includes(:study_location, :category).page(params[:page]).per(10)

    render("bookmark_templates/index.html.erb")
  end

  def show
    @bookmark = Bookmark.find(params.fetch("id_to_display"))

    render("bookmark_templates/show.html.erb")
  end

  def new_form
    @bookmark = Bookmark.new

    render("bookmark_templates/new_form.html.erb")
  end

  def create_row
    @bookmark = Bookmark.new

    @bookmark.study_location_id = params.fetch("study_location_id")
    @bookmark.category_id = params.fetch("category_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_back(:fallback_location => "/bookmarks", :notice => "Bookmark created successfully.")
    else
      render("bookmark_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_study_location_detail
    @bookmark = Bookmark.new

    @bookmark.study_location_id = params.fetch("study_location_id")
    @bookmark.category_id = params.fetch("category_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_to("/study_location_details/#{@bookmark.study_location_id}", notice: "Bookmark created successfully.")
    else
      render("bookmark_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_category
    @bookmark = Bookmark.new

    @bookmark.study_location_id = params.fetch("study_location_id")
    @bookmark.category_id = params.fetch("category_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_to("/categories/#{@bookmark.category_id}", notice: "Bookmark created successfully.")
    else
      render("bookmark_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bookmark = Bookmark.find(params.fetch("prefill_with_id"))

    render("bookmark_templates/edit_form.html.erb")
  end

  def update_row
    @bookmark = Bookmark.find(params.fetch("id_to_modify"))

    @bookmark.study_location_id = params.fetch("study_location_id")
    @bookmark.category_id = params.fetch("category_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_to("/bookmarks/#{@bookmark.id}", :notice => "Bookmark updated successfully.")
    else
      render("bookmark_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_study_location
    @bookmark = Bookmark.find(params.fetch("id_to_remove"))

    @bookmark.destroy

    redirect_to("/study_location_details/#{@bookmark.study_location_id}", notice: "Bookmark deleted successfully.")
  end

  def destroy_row_from_category
    @bookmark = Bookmark.find(params.fetch("id_to_remove"))

    @bookmark.destroy

    redirect_to("/categories/#{@bookmark.category_id}", notice: "Bookmark deleted successfully.")
  end

  def destroy_row
    @bookmark = Bookmark.find(params.fetch("id_to_remove"))

    @bookmark.destroy

    redirect_to("/bookmarks", :notice => "Bookmark deleted successfully.")
  end
end
