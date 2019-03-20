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

end