module VisitHelper
  def visit_header(visit)
    if params[:user_id]
      "#{visit.user.username} visits:"
    elsif params[:state_id]
      "#{visit.state.name} visits:"
    else
      "All Visits:"
    end
  end

  # def state_select(visit)
  #   if !params[:state_id]
  #     collection_select(visit, :state_id, State.order_alpha, :id, :name)
  #   else
  #     visit.state.name
  #   end
  # end

end