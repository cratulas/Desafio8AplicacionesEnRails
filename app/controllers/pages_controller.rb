class PagesController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard

  def index
    #@projects = Project.all
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

    if params[:q]
      if params[:q] == 'Propuesta'
        params[:q] = 0
      elsif params[:q] == 'Progreso'
        params[:q] = 1
      elsif params[:q] == 'Terminado'
        params[:q] = 2
      end
      @projects = Project.where('status = ?', params[:q])
      
      if @projects.nil?
        @projects = Project.all
      end
    else
      @projects = Project.all
    end
  
  end

  private

  def group_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :status)
  end

end
