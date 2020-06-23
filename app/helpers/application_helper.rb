module ApplicationHelper
  def page_title
    !@page_title.nil? ? "#{@page_title} | Pop fans" : "Pop fans"
  end


end


