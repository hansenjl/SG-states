class StatesController < ApplicationController

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    if @state.save
      redirect_to states_path
    else
      render 'states/new'
    end
  end

  def index
    @states = State.all
  end

  def show
    @state = State.find_by_id(params[:id])
  end

  private

  def state_params
    params.require(:state).permit(:name)
  end
end