Rails.application.routes.draw do
  # Routes for the Location resource:

  # CREATE
  get("/locations/new", { :controller => "locations", :action => "new_form" })
  post("/create_location", { :controller => "locations", :action => "create_row" })

  # READ
  get("/locations", { :controller => "locations", :action => "index" })
  get("/locations/:id_to_display", { :controller => "locations", :action => "show" })

  # UPDATE
  get("/locations/:prefill_with_id/edit", { :controller => "locations", :action => "edit_form" })
  post("/update_location/:id_to_modify", { :controller => "locations", :action => "update_row" })

  # DELETE
  get("/delete_location/:id_to_remove", { :controller => "locations", :action => "destroy_row" })

  #------------------------------

  # Routes for the Study location detail resource:

  # CREATE
  get("/study_location_details/new", { :controller => "study_location_details", :action => "new_form" })
  post("/create_study_location_detail", { :controller => "study_location_details", :action => "create_row" })

  # READ
  get("/study_location_details", { :controller => "study_location_details", :action => "index" })
  get("/study_location_details/:id_to_display", { :controller => "study_location_details", :action => "show" })

  # UPDATE
  get("/study_location_details/:prefill_with_id/edit", { :controller => "study_location_details", :action => "edit_form" })
  post("/update_study_location_detail/:id_to_modify", { :controller => "study_location_details", :action => "update_row" })

  # DELETE
  get("/delete_study_location_detail/:id_to_remove", { :controller => "study_location_details", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
