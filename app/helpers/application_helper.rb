module ApplicationHelper
  def nav_link_btn(body, path)
    link_to body, path, class: 'nav-brand d-block mx-3 fs-5 text-decoration-none'
  end
end
