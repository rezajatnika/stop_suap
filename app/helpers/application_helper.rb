module ApplicationHelper
  
  # Add class="active" for current page
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end
  
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Stop Suap"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
