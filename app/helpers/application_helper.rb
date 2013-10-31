module ApplicationHelper

  def notice
    flash[:notice]
  end

  def alerrt
    flash[:alert]
  end
end
