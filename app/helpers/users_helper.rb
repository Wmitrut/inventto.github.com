module UsersHelper
  def image_column(model, column)
    "<img src='#{model.image}' height='48'>".html_safe
  end
  def image_form_column(model, column)
    "<img src='#{model.image}' height='48'>".html_safe
  end
end
