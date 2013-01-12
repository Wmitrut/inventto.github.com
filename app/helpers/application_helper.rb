module ApplicationHelper
  extend ActiveSupport::Memoizable
  def markdownify(thing)
    file = File.join(Rails.root, "app","views","site", "#{thing}.markdown")
    RDiscount.new(IO.read(file), :smart, :filter_html).to_html
  end
  memoize :markdownify
end
