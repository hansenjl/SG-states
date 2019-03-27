class VisitsController < ApplicationController

  def new
      @visit = current_user.visits.build
      @visit.comments.build  #has_many
      @visit.build_state   #belongs_to
  end

  def create
    @visit = current_user.visits.build(visit_params)
    if @visit.save
      redirect_to visits_path
    else
      @visit.comments.build
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
    params.require(:visit).permit(:state_id, :rating, comments_attributes: [:text, :user_id], state_attributes: :name )
  end
end

