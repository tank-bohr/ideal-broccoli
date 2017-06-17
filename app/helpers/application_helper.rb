module ApplicationHelper
  def title
    title = 'Ideal Broccoli'
    title += " | #{@title}" if @title.present?
    title
  end

  def form_group(object, field, &block)
    form_group_class = 'form-group'
    form_group_class += ' has-error' if object.errors[field].present?
    content_tag(:div, class: form_group_class, &block)
  end
end
