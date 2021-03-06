class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :find_countries, only: [:new, :edit]

  def index
    @projects = Project.all
  end

  def new
    @project = current_user.projects.new
    @states = []
  end

  def create
    @project = current_user.projects.new(project_type_params)
    if @project.save
      redirect_to project_path(@project), success: 'Project was successfully created.'
    else
      flash[:error] = 'There was a problem creating this project.'
      render :new
    end
  end

  def update
    if @project.update_attributes(project_type_params)
      redirect_to project_path(@project), success: 'Project was successfully updated.'
    else
      flash[:error] = 'There was a problem updating this project.'
      render :edit
    end
  end

  def destroy
    name = @project.name
    @project.destroy
    redirect_to projects_path, success: "Deleted the project: #{ name }."
  end

private
  def find_project
    @project = Project.find(params[:id])
  end

  def find_countries
    @countries = ISO3166::Country.all_names_with_codes
  end

  def project_type_params
    params.require(:project).permit(
      :name,
      :description,
      :begin_time,
      :end_time,
      :address_1,
      :address_2,
      :city,
      :region,
      :postal_code,
      :country,
      :time_zone,
      :supplies_required,
      :children_allowed,
      :sponsoring_org,
      :max_signups
    )
  end
end
