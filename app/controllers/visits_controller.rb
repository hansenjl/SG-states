class VisitsController < ApplicationController
  before_action :if_not_logged_in, only: [:create, :new, :edit, :update]
  #before_action :set_state_if_nested, only: [:new, :index, :create]

  def new
    if params[:state_id] && @state = State.find_by_id(params[:state_id])
      #nested
       @visit = @state.visits.build
       #@visit = current_user.visits.build(state_id: params[:state_id])
    else
      #unnested
      @visit = Visit.new
    end
  end

  def create
    @visit = current_user.visits.build(visit_params)
    if @visit.save
      email = UserMailer.log_visit(@visit).deliver_now
      redirect_to visits_path
    else
      render 'visits/new'
    end
  end

  def index
    # is it a nested route?
    if params[:state_id] && @state = State.find_by_id(params[:state_id])
      @visits = @state.visits.highest_rated
      #@visits = Visit.where(state_id: params[:state_id])
    elsif params[:user_id] && @user = User.find_by_id(params[:user_id])
      @visits = @user.visits.highest_rated
    else
      @visits = Visit.rating_over(3).order_by_rating
    end
  end


  def show
    @visit = Visit.find_by_id(params[:id])
  end

  def edit
    @visit = Visit.find_by_id(params[:id])
    redirect_to visits_path if @visit.user != current_user
  end

  def update
    @visit = Visit.find_by_id(params[:id])
    redirect_to visits_path if @visit.user != current_user
    if @visit.update(visit_params)
      redirect_to visit_path(@visit)
    else
      render 'visits/edit'
    end
  end

  private
  def visit_params
    params.require(:visit).permit(:state_id, :rating)
  end

  # def set_state_if_nested
  #   @state = State.find_by_id(params[:state_id]) if params[:state_id]
  # end

end