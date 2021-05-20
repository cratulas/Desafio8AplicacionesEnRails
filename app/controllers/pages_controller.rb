class PagesController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @statuses = Project.statuses.keys
  end

  def create
    @project = Project.new(group_params)

    if @project.save
      redirect_to root_path
    else
      redirect_to pages_new_path notice: 'Falta un dato'
    end

  end

  def dashboard
    @projects = Project.all
  end

  private

  def group_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :status)
  end

end
