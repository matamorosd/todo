class ProjectsController < ApplicationController
  # allow_unauthenticated_access only: [ :new ]
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!

  # GET /projects/new
  def new
    @project = Project.new
  end

  # POST /projects
  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # GET /projects/:id
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name)
  end
end
