module ApplicationHelper
  def title
    title = 'Ideal Broccoli'
    title += " | #{@title}" if @title.present?
    title
  end
end
