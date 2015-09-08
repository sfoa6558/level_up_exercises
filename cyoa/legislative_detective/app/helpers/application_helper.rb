module ApplicationHelper
# Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Legislative Spy"
    base_title if page_title.empty?
  end
end


