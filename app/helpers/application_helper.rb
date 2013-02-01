module ApplicationHelper
  extend ActiveSupport::Memoizable
  def markdownify(thing)
    file = File.join(Rails.root, "app","views","site", "#{thing}.markdown")
    RDiscount.new(IO.read(file), :smart, :filter_html).to_html
  end
  memoize :markdownify
  def flash_message
    messages = "<div class='messages'>";
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<p class=\"#{type}-message\" style='display:none'>#{flash[type]}</p>"
        messages += "<script type='text/javascript'>

        $('.#{type}-message').show('fade',1000);
        setTimeout(\"$('.#{type}-message').hide('fade',1000);\", 5000);

        </script>"
      end
    }
    messages += "</div>"
    messages.html_safe
  end
  def clientes_visiveis
    if is_user_developer?
      Cliente.all
    else
      Cliente.do_usuario user_id
    end
  end
  def user_id
    session[:user_id]
  end
  def is_user_developer?
    User.find(user_id).developer
  end
end
