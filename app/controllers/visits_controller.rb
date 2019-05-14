class VisitsController < ApplicationController

  def new
    @visit = current_user.visits.build
  end

  def create
    @visit = current_user.visits.build(visit_params)
    if @visit.save
      redirect_to visits_path
    else
      render 'visits/new'
    end
  end

  def index
    @visits = Visit.all
  end


  def show
    @visit = Visit.find_by_id(params[:id])
  end

  private
  def visit_params
    params.require(:visit).permit(:state_id, :rating)
  end
end