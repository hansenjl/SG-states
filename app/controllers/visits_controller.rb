class VisitsController < ApplicationController

  def new
    if params[:state_id]
      @visit = current_user.visits.build(state_id: params[:state_id])
    else
      @visit = current_user.visits.build
    end
  end

  def create
    if params[:state_id]
      @visit = current_user.visits.build(visit_params)
      @visit.state_id = params[:state_id]
    else
      @visit = current_user.visits.build(visit_params)
    end
    if @visit.save
      redirect_to visits_path
    else
      render 'visits/new'
    end
  end

  def index
    if params[:user_id] && user = User.find_by_id(params[:user_id])
      @visits  = user.visits
    elsif params[:state_id] && state = State.find_by_id(params[:state_id])
      @visits  = state.visits
    else
      @visits = Visit.all
    end
  end


  def show
    @visit = Visit.find_by_id(params[:id])
  end

  private
  def visit_params
    params.require(:visit).permit(:state_id, :rating)
  end
end