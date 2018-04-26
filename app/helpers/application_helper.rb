module ApplicationHelper
  def error_tag(model, atrribute)
    if model.errors.has_key? atrribute
      content_tag :div, model.errors[atrribute].first, :class => 'error_message'
    end
  end
end
