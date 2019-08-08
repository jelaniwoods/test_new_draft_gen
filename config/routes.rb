Rails.application.routes.draw do
  # Routes for the Task resource:

  # CREATE
  match("/post_task", { :controller => "tasks", :action => "create", :via => "post"})
          
  # READ
  match("/tasks", { :controller => "tasks", :action => "index", :via => "get"})
  
  match("/tasks/:rt_task_id", { :controller => "tasks", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/patch_task/:rt_task_id", { :controller => "tasks", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_task/:rt_task_id", { :controller => "tasks", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Task resource:

  # CREATE
  match("/post_task", { :controller => "tasks", :action => "create", :via => "post"})
  
  # post#("/create_task", { :controller => "tasks", :action => "create_row" })
  
  # READ
  match("/tasks", { :controller => "tasks", :action => "index", :via => "get"})
  
  match("/tasks/:rt_task_id", { :controller => "tasks", :action => "show", :via => "get"})
  
  # UPDATE
  match("/patch_task/:rt_task_id", { :controller => "tasks", :action => "update", :via => "post"})
  # post("/update_task/:id_to_modify", { :controller => "tasks", :action => "update_row" })
  
  # DELETE
  match("/delete_task/:rt_task_id", { :controller => "tasks", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Task resource:

  # CREATE
  match("/post_task", { :controller => "tasks", :action => "create", :via => "post"})
    
  # READ
  match("/tasks", { :controller => "tasks", :action => "index", :via => "get"})
  
  match("/tasks/:rt_task_id", { :controller => "tasks", :action => "show", :via => "get"})
  
  # UPDATE
  match("/patch_task/:rt_task_id", { :controller => "tasks", :action => "update", :via => "post"})
  # post("/update_task/:id_to_modify", { :controller => "tasks", :action => "update_row" })
  
  # DELETE
  match("/delete_task/:rt_task_id", { :controller => "tasks", :action => "destroy", :via => "get"})

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
