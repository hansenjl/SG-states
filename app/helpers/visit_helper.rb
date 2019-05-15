module VisitHelper

  def visit_title(state)
    if state
      "Visits to #{state.name}"
    else
      "All Visits"
    end
  end

end