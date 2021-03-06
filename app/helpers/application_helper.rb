module ApplicationHelper
def current_entry(entry)
    @current_entry == entry
  end
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Phorn Sopheak Blog Demo"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end